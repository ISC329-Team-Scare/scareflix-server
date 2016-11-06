<!DOCTYPE html>
<html lang="en">

<head>

    <meta name="layout" content="main"/>

    <g:if test="${foundResults}">
        <title>Scareflix - ${movieInfo.movie_title} (${movieInfo.movie_year})</title>
    </g:if>
    <g:else>
        <title>Scareflix - Movie Not Found</title>
    </g:else>

</head>

<body>

        <div class="row">

            <div class="col-md-9">
                <g:if test="${foundResults}">
                    <h3>${movieInfo.movie_title} (${movieInfo.movie_year})</h3>
                    <ul>
                        <li><b>Title:</b> ${movieInfo.movie_title}</li>
                        <li><b>Year:</b> ${movieInfo.movie_year}</li>
                        <li><b>Rating:</b> ${movieInfo.movie_rating} / 10</li>
                        <li><b>Director:</b> ${movieInfo.movie_director}</li>
                    </ul>
                </g:if>
                <g:else>
                    <p>Movie not found.</p>
                </g:else>
            </div>

        </div>
</body>

</html>