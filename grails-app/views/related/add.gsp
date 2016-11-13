<!DOCTYPE html>
<html lang="en">

<head>

    <meta name="layout" content="main"/>

    <g:if test="${successful}">
        <title>Scareflix - Related - Added</title>
    </g:if>
    <g:else>
        <title>Scareflix - Related - Failure</title>
    </g:else>

</head>

<body>

        <div class="row">

            <div class="col-md-9">
                <g:if test="${successful}">
                    <div class="alert alert-success" role="alert">
                        <p>Successfully added related movies.</p>
                    </div>
                </g:if>
                <g:else>
                    <div class="alert alert-danger" role="alert">
                        <p>Unable to add related movies.</p>
                    </div>
                </g:else>
            </div>

        </div>
</body>

</html>
