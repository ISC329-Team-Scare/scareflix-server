package scareflix

import groovy.json.*

class SearchController {

    def index() {
        def moviesUrl = "http://localhost:8001/movies/"
        def genresUrl = "http://localhost:8001/genres/"
        def curl = "curl -G "
        def foundMovies = false
        def foundGenres = false
        def moviesList
        def genresList

        // Get the search term and filters
        def term = params.term
        def type = params.type
        def genre = params.genre
        def rating = params.rating

        // Construct the search api url
        def searchUrl = moviesUrl
        if (type != "Actor") {
            type = "Title"
        }
        if (genre == null) {
            genre = "Any"
        }
        if (rating == null) {
            rating = "Any"
        }
        searchUrl += "search/" + term + "/" + type + "/" + genre + "/" + rating
        searchUrl = searchUrl.replaceAll(" ", "%20")

        // Run the search
        def moviesCurl = curl + '' + searchUrl + ''
        def moviesText = moviesCurl.execute().text
        if (!moviesText.equals("")) {
            moviesList = new JsonSlurper().parseText(moviesText)

            // Check if there were any results
            if (moviesList.size() > 0) {
                foundMovies = true
            }
        }

        // Get all of the possible genres
        def genreText = ("curl " + genresUrl).execute().text
        if (!genreText.equals("")) {
            genresList = new JsonSlurper().parseText(genreText)

            // Check if there were any results
            if (genresList.size() > 0) {
                foundGenres = true
            }
        }


        [
          foundMovies:foundMovies
        , moviesList:moviesList
        , foundGenres:foundGenres
        , genresList:genresList
        , genre:genre
        , type:type
        , term:term
        , rating:rating
        ]
    }
}
