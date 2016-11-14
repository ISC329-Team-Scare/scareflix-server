package scareflix

class DeleteController {

    def index() {
        def movieBaseUrl = "http://localhost:8001/movies/id/"
        def deleteBaseUrl = "http://localhost:8001/movies/delete/"
        def successful = false
    
        // Get the movie id
        def movieID = params.id

        if (movieID != null) {
            
            // Make sure the movie id is valid
            def movieFeedUrl = movieBaseUrl + movieID

            def movieText = ("curl " + movieFeedUrl).execute().text
            if (movieText != "null") {

                // Delete the Movie
                def deleteFeedUrl = deleteBaseUrl + movieID

                def deleteText = ("curl " + deleteFeedUrl).execute().text
                if (deleteText == "true") {
                    successful = true
                }
            }
        }

        [
          successful:successful
        ]
    }
}
