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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
</head>

<body>

<div class="jumbotron text-center bg-muted" style="margin-bottom:0">
    <h1 style="color:dimgray;">My Blogging Page UOAMOS </h1>
</div>
<header class="c-header" style="margin-top:5px; margin-bottom:10px">
    <nav class="navbar navbar-expand-sm bg-muted">
        <div class="container">

            <div class="c-header_menu col-lg-4 col-md- col-sm-1">
                <ul class="navbar-nav">
                    <li class="nav-item ">
                        <a class="nav-link text-muted" href="#"> Home </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted" href="#">Forum</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-muted" href="#" id="navbarDropDown" role="button"
                           data-toggle="dropdown"> Hot </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Hot</a>
                            <a class="dropdown-item" href="#">New</a>
                            <a class="dropdown-item" href="#">Controversial</a>
                            <a class="dropdown-item" href="#">Top</a>
                            <a class="dropdown-item" href="#">Rising</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-muted" href="#" id="navbarDropDown" role="button"
                           data-toggle="dropdown"> Theme </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">School</a>
                            <a class="dropdown-item" href="#">Social</a>
                            <a class="dropdown-item" href="#">New</a>
                            <a class="dropdown-item" href="#">Top</a>
                            <a class="dropdown-item" href="#">Rising</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted" href="#"> FAQs </a>
                    </li>
                </ul>
            </div>
            <div class="c-header_user col-lg-4 col-md- col-sm-1">
                <div>
                    <%--search??--%>
                    <form action="/UserData" method="post">
                        <input type="text"
                               style="-moz-border-radius:5px; -webkit-border-radius: 5px; padding-right:1px; padding-left:3px; aborder-radius: 6px;"
                               name="Code" placeholder="Search">
                    </form>
                </div>
                <div>
                    <p>session.getAttribute("username")</p>
                    <% if (session.getAttribute("username") != null) { %>
                    <a class="nav-link text-muted" href="#"> Logout </a>
                    <% } else { %>
                    <a class="nav-link text-muted" href="#"> Login </a>
                </div>
                <% } %>
                <div>
                    <% if (session.getAttribute("username") == null) { %>
                    <a class="nav-link text-muted" href="reg.html"> Register </a></div>
                <% } %>
                <div>
                    <% if (session.getAttribute("username") != null) { %>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                        Create New Posts!
                    </button>
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
                                    </form>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-lg" onclick="">
                                            Publish!
                                        </button>
                                    </div>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close
                                    </button>
                                </div>

                            </div>
                        </div>
                    </div>
                    <% } %>

                    <%--<a class="nav-link text-muted" href="createpost.html"><h5> Create New Posts! </h5></a>--%>


                </div>
            </div>
        </div>
    </nav>
</header>


<div class="container">

    <div class="row mb-5">
        <div class="col-lg-4 col-md-6">
            <h2 style="color:dimgray;">Forum </h2>

            <img class="card-img-top" src="http://via.placeholder.com/150x150">
            <p>Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the third
                paragraph.
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.</p>

        </div>
        <div class="col-lg-4 col-md-6">
            <h2 style="color:dimgray;">Forum </h2>
            <p>Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the third
                paragraph.
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.</p>
            <p>Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the third
                paragraph.
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.</p>
        </div>
        <div class="col-lg-4 col-md-6">
            <h2 style="color:dimgray;">Forum </h2>
            <p>Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the third
                paragraph.
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.
                Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the third
                paragraph.
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.</p>
        </div>
    </div>


    <div class="row mb-5">

        <div class="col-lg-3">
            <h2 style="color:dimgray;">Forum </h2>

            <img class="card-img-top" src="http://via.placeholder.com/150x150"> alt="Card image cap">
            <p>Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the third
                paragraph.
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.</p>

        </div>

        <div class="col-lg-3">
            <h2 style="color:dimgray;">Forum </h2>
            <p>Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the third
                paragraph.
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.</p>
            <p>Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the third
                paragraph.
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.</p>
        </div>

        <div class="col-lg-3">
            <h2 style="color:dimgray;">Forum </h2>
            <p>Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the third
                paragraph.
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.
                Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the third
                paragraph.
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.</p>
        </div>

        <div class="col-lg-3">
            <h2 style="color:dimgray;">Forum </h2>
            <p>Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the third
                paragraph.
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.
                Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the third
                paragraph.
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.</p>
        </div>

    </div>

</div>

</body>
</html>
