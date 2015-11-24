<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="is">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Icelandic Online</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" integrity="sha384-aUGj/X2zp5rLCbBxumKTCw2Z50WgIr1vs/PFN4praOTvYXWlVyh2UtNUU0KAUhAX" crossorigin="anonymous">        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,700'>
        <link rel="stylesheet" type="text/css" href="<c:url value="../../../resources/static/css/styles.css" />">
    </head>
    <body>
        <main class="container">
            <div class="container-fluid">
                <div class="col-md-2"></div>
                <div class="col-md-8 text-center">
                <h1>Search</h1>
                <p></p>
                <form method="POST" action="/searchmedia" enctype="multipart/form-data" >
                    <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 text-center">
                        <div class="input-group">
                          <input type="text" name="search" id="search" class="form-control" placeholder="Search for one tag...">
                          <span class="input-group-btn">
                            <input type="Submit" class="btn btn-primary" value="Go!"/>
                          </span>
                        </div>
                    </div>
                    </div>
                </form>
                <p></p>
                <p><a href="/uploadmedia" class="btn btn-primary" role="button">Upload Media</a></p>
                <div>
                <ul>
                    <c:forEach var="mediaFile" items="${mediaFiles}">
                        <li><c:out value="${mediaFile.getName()}"/></li>
                        <li><c:out value="${mediaFile.getResource()}"/></li>
                        <li><c:out value="${mediaFile.getTag()}"/></li>
                        <li><c:out value="${mediaFile.getType()}"/></li>
                        <li><a href=/media/<c:out value="${mediaFile.getName()}"/>>link</a></li>
                    </c:forEach>
                </ul>
                </div>
                </div>
                </div>
            </div>
        </main>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>
    </body>