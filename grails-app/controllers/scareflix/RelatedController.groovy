package scareflix

import groovy.json.*

class RelatedController {

    def index() {
        def movieBaseUrl = "http://localhost:8001/movies/id/"
        def foundResults = false
        def movieInfo
    
        // Get the movie id
        def movieID = params.id

        // Get the movie info
        if (movieID != null) {
            def movieFeedUrl = movieBaseUrl + movieID

            // Run the query and process its results
            def movieText = ("curl " + movieFeedUrl).execute().text
            if (!movieText.equals("") && movieText != null) {
                movieInfo = new JsonSlurper().parseText(movieText)

                // Check if a movie was correctly found
                if (movieInfo != null) {
                    foundResults = true
                }
            }
        }
        
        [
          foundResults:foundResults
        , movieInfo:movieInfo
        ]
    }

    def add() {
        def movieBaseUrl = "http://localhost:8001/movies/id/"
        def relatedBaseUrl = "http://localhost:8001/related/"
        def successful = false 

        // Get the movie ids
        def movieID1 = params.id1
        def movieID2 = params.id2

        if (movieID1 != null && movieID2 != null && movieID1 != movieID2) {
            
            // Make sure the movie id's are valid
            def movie1FeedUrl = movieBaseUrl + movieID1
            def movie2FeedUrl = movieBaseUrl + movieID2

            def movie1Text = ("curl " + movie1FeedUrl).execute().text
            def movie2Text = ("curl " + movie2FeedUrl).execute().text
            if (movie1Text != "null" && movie2Text != "null") {

                // Add the related movies
                def relatedFeedUrl = relatedBaseUrl + movieID1 + "/" + movieID2

                def relatedText = ("curl " + relatedFeedUrl).execute().text
                if (relatedText == "true") {
                    successful = true
                }
            }
        }

        [
          successful:successful
        ]
    }
}
