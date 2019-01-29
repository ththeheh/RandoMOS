<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Article</title>
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

    <script type="text/javascript" src="article.js"></script>

</head>
<body>

<!--should be normal nav bars-->

<div class="jumbotron text-center bg-muted" style="margin-bottom:0">
    <h1 style="color:dimgray;">My article page UOAMOS </h1>
</div>
<header class="c-header" style="margin-top:5px; margin-bottom:10px">
    <nav class="navbar navbar-expand-sm bg-muted">
        <div class="container">

            <div class="c-header_menu" col-lg-4 col-md- col-sm-1>
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
            <div class="c-header_user" col-lg-4 col-md- col-sm-1>
                <div>
                    <form action="/UserData" method="post">
                        <input type="text"
                               style="-moz-border-radius:5px; -webkit-border-radius: 5px; padding-right:1px; padding-left:3px; aborder-radius: 6px;"
                               name="Code" placeholder="Search">
                    </form>
                </div>
                <div>
                    <a class="nav-link text-muted" href="#"> Logout </a>
                </div>
            </div>
        </div>
    </nav>
</header>
<!---->

<div class="container">
    <div class="row">
        <div class="header">
            <!--<div class="triangulo"></div>-->
            <div class="profile">
                <!--to add the profile imgs -->
                <img class='card-img-top img-thumbnail rounded-circle boarder-primary' src='./images/icons/666201.png'
                     alt='Card image cap' style='width: 150px;height: 150px;'>
                <span class="name-author"></span>
            </div>
            <h2 class="title"></h2>
        </div>

        <!-- INFO -->
        <div class="row">
            <div class="col-xs-12 mx-5 ">
                <form>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user "></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="username">
                    </div>
                </form>
                <h2 style="line-height: 25px;">Article Name:This is text genered from Lorem ipsum.</h2>
                <br/>
                <h4 style="line-height: 25px;">Date: 30/01/2019</h4>
            </div>
        </div>
        <div class="row row-eq-height m-auto">
            <div class="col-lg-8 text m-auto">
                <p></p>
            </div>

        </div>
    </div>
</div>

<br/>
<br/>

<div class="row">
    <div class="col-lg-8 m-auto">
        <div class="form-group">
            <label for="comment">Your Comment:</label>
            <textarea class="form-control" rows="5" id="comment"></textarea>
        </div>
        <button type="submit" class="btn btn-info btn-lg float-right" onclick="addcomment()"><strong>Comment</strong>
        </button>
    </div>
</div>
<br/>
<br/>
<br/>

<div class="row">
    <ul id="cmList" class="col-lg-8 m-auto">

    </ul>
</div>

<div class="jumbotron bg-dark jumbotron-fluid">
    <img class="img-responsive mx-auto d-block" src="" width="600">
</div>
</body>
</html>