package scareflix

class AddController {

    def index() { }

    def submit() {
        def addMovieBase = "http://localhost:8001/movies/add/"
        def curl = "curl -G "
        def successful = false

        // Get the movie title
        def movieTitle = params.title

        if (movieTitle != null) {
            // Construct the add movie url
            def addMovieUrl = addMovieBase + movieTitle
            addMovieUrl = addMovieUrl.replaceAll(" ", "%20")

            // Attempt to add the movie
            def addMovieCurl = curl + '' + addMovieUrl + ''
            def response = addMovieCurl.execute().text
            if (response == "true") {
                successful = true
            }
        }

        [
          successful:successful
        ]
    }
}
