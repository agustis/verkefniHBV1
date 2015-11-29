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
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </head>
    <body>
        <main class="container">
            <div class="container-fluid">
                <div class="col-md-2"></div>
                <div class="col-md-8 text-center">
                    <h1>Upload media</h1>
                    <form method="POST" action="/uploadmedia" enctype="multipart/form-data" id="uploadForm" >
                        <div style="float:inherit;">
                            <p style="display:inline-block; float:inherit">File:</p>
                            <input type="file" name="files" id="files" multiple style="display:inline;float:inherit">
                        </div>
                        <ul id="fileInfo"></ul>
                        <input type="Submit" class="btn btn-primary" value="Submit"
                                id="btnSubmit" style="float:inherit; display:inline-block;"/>
                    </form>
                    <br/>
                    <p><a href="/searchmedia" class="btn btn-primary" role="button">Search Media</a></p>

                </div>
                <div class="col-md-4"></div>
            </div>
        </main>

        <script>
            'use strict';
            var storedFiles = [];
            var types = [];
            var ul = document.getElementById('fileInfo');

            document.addEventListener('DOMContentLoaded', init, false);

            function init() {
                document.getElementById('files').addEventListener('change', handleFileSelect, false);
                document.getElementById('uploadForm').addEventListener('submit', handleForm, false);
            }

            function handleFileSelect(e) {
                var files = Array.prototype.slice.call(e.target.files);
                files.forEach(function(file) {
                    var div = document.createElement('div');
                    var li = document.createElement('li');

                    var span = document.createElement('input');
                    span.setAttribute("type", "button");
                    span.setAttribute("value", "Cancel");
                    span.setAttribute("class", "btn btn-primary");
                    span.setAttribute("style","display:inline; float:inherit");


                    span.addEventListener('click', removeFile, false);
                    var index = storedFiles.length;
                    div.setAttribute('data-index', index);

                    div.appendChild(li);
                    div.appendChild(makeTagInput(index));
                    div.appendChild(span);
                    ul.appendChild(div);

                    var name = file.name;
                    var dotIndex = name.lastIndexOf('.');
                    var type = dotIndex === -1 ? 'jpg' : name.substring(dotIndex);
                    li.textContent = name;
                    types.push(type);
                    storedFiles.push(file);
                });
            }

            function makeTagInput(index) {
                var div = document.createElement('div');
                var span = document.createElement('span');
                var input = document.createElement('input');

                span.textContent = 'Tags: ';
                input.setAttribute('type', 'text');
                input.setAttribute('class', 'tags');
                input.setAttribute('data-index', index);
                input.setAttribute("style","display:inline-block; float:inherit");

                div.appendChild(span);
                div.appendChild(input);

                return div;
            }

            function removeFile(e) {
                var div = e.target.parentNode;
                var index = div.dataset.index;
                delete storedFiles[index];
                delete types[index];

                div.parentNode.removeChild(div);
            }

            function tagsCmp(a,b) {
                return parseInt(a.dataset.index) - parseInt(b.dataset.index);
            }

            function handleForm(e) {
                e.preventDefault();
                var data = new FormData();

                var tags = Array.prototype.slice.call(document.getElementsByClassName('tags')).sort(tagsCmp);
                for (var k= 0; k < tags.length; k++) {
                    data.append('tags[]', tags[k].value);
                }

                storedFiles = storedFiles.filter(Boolean);
                for(var i=0, len=storedFiles.length; i<len; i++) {
                    data.append('files[]', storedFiles[i]);
                }

                types = types.filter(Boolean);
                for(var j=0, len=types.length; j<len; j++) {
                    data.append('types[]', types[j]);
                }

                var span_msg = document.createElement('span');
                // reset for new uploads
                storedFiles = [];
                types = [];
                ul.textContent = '';
                span_msg.textContent = '';

                // Breyta þessu
                data.append('type', 'image');

                var xmlhr = new XMLHttpRequest();
                xmlhr.open('POST', '/uploadmedia', true);

                xmlhr.onload = function(e) {
                    if(this.status == 200) {
                        console.log('success!');
                        span_msg.textContent = "Success uploading file!";
                    } else {
                        console.log('no go');
                        span_msg.textContent = "Failure uploading file!";
                    }
                    ul.appendChild(span_msg);
                };

                xmlhr.send(data);
            }
        </script>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>
    </body>
</html>