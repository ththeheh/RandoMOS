<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>UOAMOS_Our First Project </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>




    <style>
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
            float:right;
        }

        .btn:hover {
            background-color: #eff5f5;
            color: #024a26;
        }

        .navbar-nav li {
            display: inline-block;
            font-size: 20px;
            padding: 20px;
            float: right;
        }

        .article {
            width: 900px;
            height: 400px;
            padding: 50px;
            border: 1px solid dimgray;
        }
       .column {
           float : left;
           padding: 10px;
           height: 300px;
       }
        .left{
            width: 25%;
        }
        .middle{
            width: 15%;
        }
        .right{
            width: 60%;
        }
        /*.jumbotron{*/
            /*margin:0;*/
            /*width:100%;*/
            /*height:50px;*/

        /*}*/

        div.sticky {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            background-color: #eff5f5;
            opacity:0.8;
            padding: 0px;
            font-size: 20px;
        }
        div .column-left image{
            width:100%;
            height:auto;
        }

        /*.c-header {*/
            /*background-color: transparent;*/
        /*}*/







    </style>
</head>


<script>
    <c:if test="${delete=='deleted'}" >
    alert("Your account is deleted! You are always welcomed to be back to RandoMOS!")
    </c:if>

    ${'.post'}.onclick.ajax({
        type: 'POST',
        url: 'changIconServlet',
        data: {'iconPath': document.getElementById('featuredImage').src},
        async: false,
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
</script>

<body>

<div class="sticky">
    <header class="c-header" style="margin-top:30px; margin-bottom:10px">

        <div class="row">
            <nav class="navbar navbar-expand-sm bg-muted">

                <div class="c-header_menu col-lg-12 col-md-12 col-sm-12">

                    <ul class="navbar-nav">
                        <li><h1 style="color:dimgray; text-align: center;">Welcome to RandoMOS! </h1></li>

                        <li>
                            <button type="button" class="btn btn-sm btn-gray btn-lg" onclick="location.href='mainPage.jsp'">
                                Home
                            </button>
                        </li>

                        <div>
                            <c:choose>
                                <c:when test="${sessionScope.username!= null}">

                                    <li>
                                        <form action="logout" method="get">
                                            <button type="submit" class="btn btn-sm btn-info btn-lg">Log out</button>
                                        </form>
                                    </li>

                                    <li>
                                        <form action="userinfo" method="get">
                                            <button type="submit" class="btn  btn-sm btn-info btn-lg">My Profile</button>
                                        </form>
                                    </li>


                                </c:when>
                                <%--<a class="nav-link text-muted" href="mainPage.jsp" onclick="destroySess()"> Logout </a>--%>
                                <c:otherwise>
                                    <li>
                                        <button type="button" class="btn btn-sm btn-gray btn-lg"
                                                onclick="location.href='loginPage.jsp'">
                                            Login
                                        </button>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <div>
                            <c:choose>
                            <c:when test="${sessionScope.username==null}">
                            <li>
                                <button type="button" class="btn btn-sm btn-gray btn-lg" onclick="location.href='reg.jsp'">
                                    Register
                                </button>
                            </li>

                        </div>

                        </c:when>
                        <c:otherwise>
                            <li>
                                <button type="button" class="btn btn-sm btn-primary" data-toggle="modal"
                                        data-target="#myModal">
                                    Create New Posts!
                                </button>
                            </li>

                            <li>
                                    <%--servlet for retrieving your posts needed--%>
                                <form action="#" method="get">
                                    <button type="submit" class="btn btn-sm btn-info btn-lg">Browse Your Posts</button>
                                </form>
                            </li>
                        </c:otherwise>
                        </c:choose>

                    </ul>
                </div>
            </nav>
        </div>


    </header>
</div>


    <%------------------------------------%>

    <%--<div class="jumbotron text-center" style="margin-bottom:0; background-color: #eff5f5; ">--%>
        <%--<h1 style="color:dimgray;">Welcome to RandoMOS! </h1>--%>
    <%--</div>--%>
    <%--</div>--%>






<%---------------------------------forum-------------------------------------------------------%>


<div class="container">

    <div class="row mb-5">
        <div class="article">
            <div class="column left">
                <img src="https://media.allure.com/photos/5bf1b1502ab5072a91e1853a/16:9/w_1200%2Cc_limit/travel%20editor%20favorite%20products.jpg"
                     class="rounded-cornor float-left" width="300" height="230"  >
            </div>
            <div class="column middle"></div>

            <div class="column right">
                <h2 style="color:dimgray;">Article </h2>
                <p>Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the
                    third
                    paragraph.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.</p>
            </div>
        </div>
    </div>

    <div class="row mb-5">
        <div class="article">
            <div class="column left">
                <img src="https://imagesvc.timeincapp.com/v3/mm/image?url=https%3A%2F%2Ftimedotcom.files.wordpress.com%2F2018%2F02%2Ftaking-photo-in-car.jpg&w=800&c=sc&poi=face&q=85"
                     class="rounded-cornor float-left" width="300" height="230"  >
            </div>
            <div class="column middle"></div>

            <div class="column right">
                <h2 style="color:dimgray;">Article </h2>
                <p>Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the
                    third
                    paragraph.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.
                    Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the
                    third
                    paragraph.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.
                    Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the
                    third
                    paragraph.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.</p>
            </div>
        </div>
    </div>

    <div class="row mb-5">
        <div class="article">
            <div class="column left">
                <img src="https://imagesvc.timeincapp.com/v3/mm/image?url=https%3A%2F%2Ftimedotcom.files.wordpress.com%2F2018%2F02%2Ftaking-photo-in-car.jpg&w=800&c=sc&poi=face&q=85"
                     class="rounded-cornor float-left" width="300" height="230"  >
            </div>
            <div class="column middle"></div>

            <div class="column right">
                <h2 style="color:dimgray;">Article </h2>
                <p>Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the
                    third
                    paragraph.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.
                    Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the
                    third
                    paragraph.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.
                    Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the
                    third
                    paragraph.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.</p>
            </div>
        </div>
    </div>

    <div class="row mb-5">
        <div class="article">
            <div class="column left">
                <img src="https://imagesvc.timeincapp.com/v3/mm/image?url=https%3A%2F%2Ftimedotcom.files.wordpress.com%2F2018%2F02%2Ftaking-photo-in-car.jpg&w=800&c=sc&poi=face&q=85"
                     class="rounded-cornor float-left" width="300" height="230"  >
            </div>
            <div class="column middle"></div>

            <div class="column right">
                <h2 style="color:dimgray;">Article </h2>
                <p>Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the
                    third
                    paragraph.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.
                    Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the
                    third
                    paragraph.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.
                    Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the
                    third
                    paragraph.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.</p>
            </div>
        </div>
    </div>


</div>




<%-------------------------------------------------modal-----------------------------%>

                <div class="modal" id="myModal">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">You can write your post here!
                                </h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                <form action="#">
                                    <%--send to servlet and build the post using this page.--%>
                                    <div class="form-group">
                                        <label for="title"><strong> Your Title:</strong></label>
                                        <input type="text" class="form-control" id="title" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="post"></label>
                                        <textarea class="form-control" rows="20" id="post"
                                                  placeholder="Put your post content here..."></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-lg" onclick="">
                                            Publish!
                                        </button>
                                    </div>
                                </form>

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
