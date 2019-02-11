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

        .card {

            background: #eff5f5;

        }

        .card-footer {
            display: inline-block;
        }

        .grid-container {
            display: grid;
            grid-row-gap: 50px;

        }

        form, h6, h5 {
            color: dimgray;
        }

        input, select {
            border: 1px solid #cccccc;
            border-radius: 4px;
            /*resize: vertical;*/
        }

        #iconModal img {
            height: 100px;
            width: 100px;
        }

        .custom-file-wrapper {
            position: relative;
            overflow: hidden;
            display: inline-block;
        }

        .custom-file-wrapper input[type=file] {

            font-size: 100px;
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;

        }

        .btn {
            background-color: #e6ffe6;
            border: none;
            color: white;
            padding: 8px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 2px 2px;
            -webkit-transition-duration: 0.4s;
            transition-duration: 0.4s;
            cursor: pointer;

        }

        .btn {
            background-color: white;
            color: #047c40;
            border: 1.5px solid #047c40;
        }

        .btn:hover {
            background-color: #eff5f5;
            color: #024a26;
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


        function changeImage(numImage) {
            var formData = new FormData();
            var image = document.getElementById('featuredImage');
            image.src = "../images/icons/" + imageCollection[numImage].name + ".png";
            var iconName = imageCollection[numImage].name + ".png";
            console.log(iconName);
            saveIconLib(iconName);
        }

         function uploadImage(event) {
            var formData = new FormData();
            var image = document.getElementById('featuredImage');
            image.src = URL.createObjectURL(event.target.files[0]);
            formData.append("icon", $('input[type=file]')[0].files[0]);
            saveIconUpload(formData);
        };

        // anothe way to use <a href="MyServlet?data=MyData">Go to server</a>
        function saveIconLib(iconName) {
            $.ajax({
                type: 'POST',
                url: 'changeiconlib',
                data: {'iconName': iconName},
                async: true,
                dataType: 'json',
                success: function () {
                    alert('Updated Sucessfully!');
                },
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }


        function saveIconUpload(formData) {
            $.ajax({
                type: 'POST',
                url: 'changeiconup',
                data: formData,
                processData: false,
                contentType: false,
                async: true,
                success: function () {
                    alert('Updated Sucessfully!');
                },
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }

    </script>

</head>
<body>


<div class="container">
    <div class="admindirect">
    <c:if test="${sessionScope.admin==true}">
        <li>
                <%--servlet for retrieving your posts needed--%>
            <form action="admin" method="get">
                <button type="submit" class="btn btn-sm btn-primary" name="Admin"
                        value="true">Admin Page
                </button>
            </form>
    </c:if>
    </div>
    <div class="col-lg-8 col-md-8 col-sm-8 my-5" style="margin: auto">
        <div class="card">

            <%--card header--%>
            <div class="card-header">

                <h3 style="color:dimgray;"> My Profile </h3>

            </div>

            <%--card body--%>
            <div class="card-body">

                <div class="row">

                    <%--first column under card body--%>
                    <div class="grid-container col-lg-5 col-md-4 col-sm-4">

                        <%--icon image--%>
                        <div class="grid-item">
                            <img class="img-circle mx-5" style="width:100px; height:100px" id="featuredImage"
                                 src='${userInfo.iconPath}' alt="profile icon"/>
                        </div>


                        <div class="grid-item" style="margin-left: 20px">

                            <%--predefined icons--%>
                            <button id="fromLibrary" type="button" class="btn btn-warning btn-lg" data-toggle="modal"
                                    data-target="#iconModal">Choose your icon
                            </button>


                            <%--image upload--%>
                            <div class="input-group mb-3">
                                <div class="custom-file-wrapper">
                                    <button class="btn btn-info btn-lg">Upload file</button>
                                    <input type="file" class="custom-file-input" accept="image/*" name="image"
                                           id="uploadfile" onchange="uploadImage(event)">
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--second column under card body--%>
                    <div class="col-lg-7 col-md-6 col-sm-6 m-auto">
                        <div id="userInfo">
                            <br>
                            <h6>User Name: ${userInfo.userName} </h6>
                            <h6>First Name: ${userInfo.firstName}</h6>
                            <h6>Last Name: ${userInfo.lastName}</h6>
                            <h6>Birthday: ${userInfo.birthday}</h6>
                            <h6>Country: ${userInfo.country}</h6>
                            <h6>Email: ${userInfo.email}</h6>
                            <h6>Description: ${userInfo.description}</h6>
                        </div>
                    </div>
                </div>
            </div>

            <%--footer--%>
            <div class="card-footer">
                <form action="deleteAccount" method="get">
                    <button type="submit" style="float: right;" class="btn btn-danger btn-lg"
                            onclick="alert('Your account will be deleted! Going to the main page...')">Delete Account
                    </button>
                </form>
                <form action="profileUpdate.jsp">
                    <button type="submit" style="float: right;" class="btn btn-primary btn-lg">Edit profile</button>
                </form>
                <form action="mainPage.jsp">
                    <button type="submit" style="float: right;" class="btn btn-primary btn-lg">Go to Main</button>
                </form>
            </div>
        </div>
    </div>
</div>


<%--------------------------------modal-----------------------------------------%>
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
                <button type="button" class="btn btn-danger" data-dismiss="modal">Done
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>