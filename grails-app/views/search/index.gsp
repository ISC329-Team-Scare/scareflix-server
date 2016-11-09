<!DOCTYPE html>
<html lang="en">

<head>

    <meta name="layout" content="main"/>

    <title>Scareflix - Search</title>

</head>

<body>

        <div class="row">

            <div class="col-md-3">
            <form role="search" action="/search">
            <div class="panel panel-default">
            <div class="panel-body">
                <p class="lead">Filters</p>
                <form class="" role="search" action="/search">
                <p><b>Term</b></p>
                <select class="selectpicker form-control" name="type">
                    <g:if test="${type.equals('Actor')}">
                        <option>Title</option>
                        <option selected>Actor</option>
                    </g:if>
                    <g:else>
                        <option selected>Title</option>
                        <option>Actor</option>
                    </g:else>
                </select>
                <g:if test="${foundGenres}">
                    <p></br><b>Genre</b></p>
                    <select class="selectpicker form-control" name="genre" data-live-search="true">
                        <option>Any</option>
                        <g:each in="${genresList}" var="genreT">
                            <g:if test="${genreT.genre_name.equals(genre)}">
                                <option selected>${genreT.genre_name}</option>
                            </g:if>
                            <g:else>
                                <option>${genreT.genre_name}</option>
                            </g:else>
                        </g:each>
                    </select>
                </g:if>
                <p></br><b>Rating</b></p>
                <select class="selectpicker form-control" name="rating" data-live-search="true">
                    <option>Any</option>
                    <g:each in="['9','8','7','6','5','4','3','2','1','0']" var="num">
                        <g:if test="${num.equals(rating)}">
                            <option selected>${num}</option>
                        </g:if>
                        <g:else>
                            <option>${num}</option>
                        </g:else>
                    </g:each>
                </select>
                <p></br></p>
                        <div class="input-group">
                          <input type="text" class="form-control" placeholder="Search" name="term" value="${term}">
                          <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                          </div>
                        </div>
                </form>
                </div>
                </div>
            </div>

            <div class="col-md-9">
                <h2 class="lead">Search Results</h2>
                <g:if test="${foundMovies}">
                    <ul>
                        <g:each in="${moviesList}" var="movie">
                            <li>
                                <a href="movie?id=${movie.movie_id}">
                                    ${movie.movie_title}
                                </a>
                            </li>
                        </g:each>
                    </ul>
                </g:if>
                <g:else>
                    <div class="alert alert-danger" role="alert">
                        <p>No results found.</p>
                    </div>
                </g:else>
            </div>

        </div>
</body>

</html>
