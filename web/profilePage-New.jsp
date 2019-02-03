<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile Display</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

    <style>


        #iconModal img {
            height: 100px;
            width: 100px;
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

    </style>
    <script>
        // "use strict";

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
            image.src = "../images/icons/" + imageCollection[numImage].name + ".png";
            saveIcon();
        }

        var uploadImage = function (event) {
            var image = document.getElementById('featuredImage');
            image.src = URL.createObjectURL(event.target.files[0]);
            saveIcon();
        }
        // anothe way to use <a href="MyServlet?data=MyData">Go to server</a>

        function saveIcon(){
            $.ajax({
                type: 'POST',
                url: 'changeicon',
                data: {'iconPath': document.getElementById('featuredImage').src},
                async: true,
                dataType: 'json',
                success: function (data) {
                        if (data.success) {
                            alert('Update Sucess!');
                        } else {
                            alert('Update Fail!');
                        }
                    },
                error: function (err) {
                    alert('Internet Error!');
                }
            });
        }

    </script>
</head>
<body>


<div class="row">
    <div class="col-lg-6 col-md-8 col-sm-12 my-5" style="margin: auto">
        <div class="card bg-light" style="background:#F8F9F9;">
            <div class="card-header p-0">
                <h3>My Profile</h3>
            </div>
            <div class="card-body col-lg-12 col-md-12 col-sm-12">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <img class="img-circle mx-5" style="width:100px;height:100px" id="featuredImage"
                             src='${userInfo.iconPath}' alt="placeholder"/>

                        <button id="fromLibrary" type="button" class="btn btn-info" data-toggle="modal"
                                data-target="#iconModal">Choose from library
                        </button>

                        <div class="modal m-auto modal-sm " id="iconModal" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel"
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
                                        ><img
                                                src="images/icons/boy1.png" alt="thumb"></div>
                                        <div onclick="changeImage(1)" id="1" class="thumb-holder m-5 padding-auto"
                                        ><img
                                                src="images/icons/boy2.png" alt="thumb"></div>
                                        <div onclick="changeImage(2)" id="2" class="thumb-holder m-5 padding-auto"
                                        ><img
                                                src="images/icons/girl1.png" alt="thumb"></div>
                                        <div onclick="changeImage(3)" id="3" class="thumb-holder m-5 padding-auto"
                                        ><img
                                                src="images/icons/girl2.png" alt="thumb"></div>
                                        <div onclick="changeImage(4)" id="4" class="thumb-holder m-5 padding-auto"
                                        ><img
                                                src="images/icons/girl3.png" alt="thumb"></div>
                                        <div onclick="changeImage(5)" id="5" class="thumb-holder m-5 padding-auto"
                                        ><img
                                                src="images/icons/girl4.png" alt="thumb"></div>
                                        <div onclick="changeImage(6)" id="6" class="thumb-holder m-5 padding-auto"
                                        ><img
                                                src="images/icons/girl5.png" alt="thumb"></div>
                                        <div onclick="changeImage(7)" id="7" class="thumb-holder m-5 padding-auto"
                                        ><img
                                                src="images/icons/girl6.png" alt="thumb"></div>
                                        <div onclick="changeImage(8)" id="8" class="thumb-holder m-5 padding-auto"
                                        ><img
                                                src="images/icons/man1.png" alt="thumb"></div>
                                        <div onclick="changeImage(9)" id="9" class="thumb-holder m-5 padding-auto"
                                        ><img
                                                src="images/icons/man2.png" alt="thumb"></div>
                                    </div>


                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-dismiss="modal">Done
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--styling the button to be consistent: https://getbootstrap.com/docs/4.0/components/input-group/--%>
                        <div class="input-group mb-3">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" accept="image/*" name="image"
                                       id="uploadfile" onchange="uploadImage(event)">
                                <label class="custom-file-label" for="uploadfile">Upload</label>
                            </div>
                        </div>
                        <form action="updateicon" method="get">
                            <button type="submit" class="btn btn-primary btn-lg">Done Updating Icon!</button>
                        </form>

                        <%--<div class="upload-btn-wrapper">--%>
                        <%--<div class="btn btn-info btn-" style="height: 50px;width: 80px">--%>
                        <%--<label for="avatar" style="font-size: 12px" class="p-0 m-0" >Upload</label>--%>
                        <%--<input type="file"--%>
                        <%--id="avatar" name="avatar"--%>
                        <%--accept="image/png, image/jpeg">--%>
                        <%--</div>--%>
                        <%--</div>--%>


                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 m-auto">
                        <div id="userInfo">
                            <br>
                            <h6><strong>User Name:</strong> ${userInfo.userName} </h6>
                            <h6><strong>First Name:</strong> ${userInfo.firstName}</h6>
                            <h6><strong>Last Name:</strong> ${userInfo.lastName}</h6>
                            <h6><strong>Birthday:</strong> ${userInfo.birthday}</h6>
                            <h6><strong>Country:</strong> ${userInfo.country}</h6>
                            <h6><strong>Email:</strong> ${userInfo.email}</h6>
                            <h6><strong>Description:</strong> ${userInfo.description}</h6>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 my-5">

                        <form action="profileUpdate.jsp">
                            <button type="submit" class="btn btn-primary btn-lg">Edit</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <form action="deleteAccount" method="get">
                <button type="submit" class="btn btn-danger btn-lg"
                        onclick="alert('Your account will be deleted! Going to the main page...')">Delete Account
                </button>
            </form>
        </div>
    </div>
</div>
</div>
</div>

</body>
</html>