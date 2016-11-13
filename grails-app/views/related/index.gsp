<!DOCTYPE html>
<html lang="en">

<head>

    <meta name="layout" content="main"/>

    <g:if test="${foundResults}">
        <title>Scareflix - Related - ${movieInfo.movie_title} (${movieInfo.movie_year})</title>
    </g:if>
    <g:else>
        <title>Scareflix - Related - Movie Not Found</title>
    </g:else>

</head>

<body>

        <div class="row">

            <div class="col-md-9">
                <g:if test="${foundResults}">
                    <h3>Add Related Movie</h3>
                    </br>
                    <h4>${movieInfo.movie_title} (${movieInfo.movie_year})</h4>
                    <form class="" role="add related movie" action="/related/add">
                        <div class="input-group" style="margin-top: 20px; margin-bottom: 20px;">
                            <input style="display:none;" type="text" class="form-control" name="id1" value="${movieInfo.movie_id}">
                            <span class="input-group-addon" id="basic-addon1">Related Movie ID</span>
                            <input type="text" class="form-control" name="id2" placeholder="Ex. tt0765430">
                        </div>
                        <button class="btn btn-default" type="submit">Submit</button>
                    </form>
                </g:if>
                <g:else>
                    <div class="alert alert-danger" role="alert">
                        <p>Movie not found.</p>
                    </div>
                </g:else>
            </div>

        </div>
</body>

</html>
