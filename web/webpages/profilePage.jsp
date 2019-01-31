<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile Display</title>

    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet"
          id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>

    <style>

        .modal-body {
            width: 500px;
            height: 800px;

        }

        #fromLibrary {
            height: 30px;
            width: 120px;
            font-size: 11px;
            margin-top: 50px;
            margin-bottom: 10px;

        }

        .upload-btn-wrapper input[type=file] {

            left: 0;
            top: 0;
            opacity: 0;
            padding-bottom: 30px;

        }

        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            width: 80%;
        }

        #userinfo {
            color: darkslategray;
        }
    </style>
    <script>
        "use strict";

        var imageCollection = [
            {name: "boy1", description: "This is Sam"},
            {name: "boy2", description: "This is Tom "},
            {name: "girl1", description: "This is Alice"},
            {name: "girl2", description: "This is Amy "},
            {name: "girl3", description: "This is Chloe"},
            {name: "girl4", description: "This is Anna"},
            {name: "girl5", description: "This is Jane"},
            {name: "girl6", description: "This is Cindy"},
            {name: "man1", description: "This is John"},
            {name: "man2", description: "This is a Mr.Simon"}
        ];

        var selectedImage = 0;

        function changeImage(numImage) {

            var image = document.getElementById('featuredImage');
            console.log(numImage);
            image.src = "../images/icons/" + imageCollection[numImage].name + ".png";
            selectedImage = numImage;
            document.getElementById("descriptionText").innerText = imageCollection[numImage].description;
            // image.src = URL.createObjectURL(event.target.files[0]);

        }

        /*        function libraryicon() {
                    var modal = document.getElementById('myModal');

        // Get the image and insert it inside the modal - use its "alt" text as a caption
                    var img = document.getElementById('myImg');
                    var modalImg = document.getElementById("img01");
                    var captionText = document.getElementById("caption");
                    img.onclick = function () {
                        modal.style.display = "block";
                        modalImg.src = this.src;
                        captionText.innerHTML = this.alt;
                    }

        // Get the <span> element that closes the modal
                    var span = document.getElementsByClassName("close")[0];

        // When the user clicks on <span> (x), close the modal
                    span.onclick = function () {
                        modal.style.display = "none";
                    }
                }

           // Get the <span> element that closes the modal
                    var span = document.getElementsByClassName("close")[0];

        // When the user clicks on <span> (x), close the modal
                    span.onclick = function () {
                        modal.style.display = "none";
                    }
                }*/
    </script>
</head>
<body>

<br><br>
<div class="container">


    <div class="col-lg-10 col-md-10 col-sm-10 my-5" style="margin: auto ">
        <div class="card" style="background:#F8F9F9">
            <div class="card-header">
                <h3>My Profile</h3>
            </div>

            <div class="card-body">
                <div class="row-fluid">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="span4 ">

                            <script>
                                function readURL(input) {
                                    if (input.files && input.files[0]) {
                                        var reader = new FileReader();

                                        reader.onload = function (e) {
                                            $('#blah')
                                                .attr('src', e.target.result)
                                                .width(150)
                                                .height(200);
                                        };

                                        reader.readAsDataURL(input.files[0]);
                                    }
                                }
                            </script>
                            <img class="img-circle" id="featuredImage" src="../images/icons/boy1.png"
                                 alt="placeholder"/>


                            <button id=fromLibrary type="button" class="btn btn-info" data-toggle="modal"
                                    data-target="#iconModal">Choose from library
                            </button>


                            <!--

                                                        <div class="upload-btn-wrapper">
                                                            <button class="btn btn-info">Upload a file</button>
                                                            <input type="file" name="myfile" accept="image/gif,image/jpeg,image/png"  />
                                                        </div>
                            -->
                            <div class="upload-btn-wrapper">
                                <div class="btn btn-info" style="height: 30px;width: 120px">
                                    <label for="avatar" style="font-size: 10px">Choose a profile picture</label>

                                    <input type="file"
                                           id="avatar" name="avatar"
                                           accept="image/png, image/jpeg">
                                </div>
                            </div>


                        </div>


                        <div class="span6">
                            <div id="userinfo">
                                <br><br>
                                <h6>User Name: + ${userName} </h6>
                                <br>
                                <h6>First Name: + ${firstName} </h6>
                                <br>
                                <h6>Last Name: + ${lastName} </h6>
                                <br>
                                <h6>Email: + ${email}</h6>
                                <br>
                                <h6>Birthday: + ${birthday}</h6>
                                <br>
                                <h6>Description + ${description}</h6>
                                <br>
                                <h6>Country + ${country}</h6>
                                <h6></h6>
                            </div>
                        </div>
                        <div class="span2">
                            <div class="col-lg-12 col-sm-6">
                                <button class="btn btn-info " type="button" id="dropdown-menu2"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    Action
                                    <span class="icon-cog icon-white"></span><span class="caret"></span>
                                </button>
                                <div class="dropdown-menu " aria-labelledby="dropdown-menu2">
                                    <a class="dropdown-item" href="profileUpdate.html"><span class="icon-wrench "></span>Modify</a>
                                    <a class="dropdown-item" href="#"><span class="icon-trash "></span>Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!--Modal for library icons-->

<!--&lt;!&ndash;-->
<div class="modal m-auto modal-sm " id="iconModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content m-auto">

            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title">Scroll and pick your icon!!</h5>
            </div>

            <!-- Modal body -->
            <div class="modal-body centered">
                <div onclick="changeImage(0)" id="0" class="thumb-holder m-5 padding-auto"
                     style="width:150px;height: 150px"><img
                        src="../images/icons/boy1.png" alt="thumb"></div>
                <div onclick="changeImage(1)" id="1" class="thumb-holder m-5 padding-auto"
                     style="width:150px;height: 150px"><img
                        src="../images/icons/boy2.png" alt="thumb"/></div>
                <div onclick="changeImage(2)" id="2" class="thumb-holder m-5 padding-auto"
                     style="width:150px;height: 150px"><img
                        src="../images/icons/girl1.png" alt="thumb"/></div>
                <div onclick="changeImage(3)" id="3" class="thumb-holder m-5 padding-auto"
                     style="width:150px;height: 150px"><img
                        src="../images/icons/girl2.png" alt="thumb"/></div>
                <div onclick="changeImage(4)" id="4" class="thumb-holder m-5 padding-auto"
                     style="width:150px;height: 150px"><img
                        src="../images/icons/girl3.png" alt="thumb"/></div>
                <div onclick="changeImage(5)" id="5" class="thumb-holder m-5 padding-auto"
                     style="width:150px;height: 150px"><img
                        src="../images/icons/girl4.png" alt="thumb"/></div>
                <div onclick="changeImage(6)" id="6" class="thumb-holder m-5 padding-auto"
                     style="width:150px;height: 150px"><img
                        src="../images/icons/girl5.png" alt="thumb"/></div>
                <div onclick="changeImage(7)" id="7" class="thumb-holder m-5 padding-auto"
                     style="width:150px;height: 150px"><img
                        src="../images/icons/girl6.png" alt="thumb"/></div>
                <div onclick="changeImage(8)" id="8" class="thumb-holder m-5 padding-auto"
                     style="width:150px;height: 150px"><img
                        src="../images/icons/man1.png" alt="thumb"/></div>
                <div onclick="changeImage(9)" id="9" class="thumb-holder m-5 padding-auto"
                     style="width:150px;height: 150px"><img
                        src="../images/icons/man2.png" alt="thumb"/></div>
            </div>


            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close
                </button>
            </div>
        </div>
    </div>
</div>

</body>
</html>