<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

    <script type="text/javascript" src="article.js"></script>

    <style>
        .btn {
            background-color: #e6ffe6; /* Green */
            border: none;
            color: white;
            padding: 8px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 2px 2px;
            -webkit-transition-duration: 0.4s; /* Safari */
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

        .navbar-nav li {
            display: inline-block;
            font-size: 20px;
            padding: 20px;
        }

    </style>

    <script>

function userCommentUpdate(){
    // console.log("this is runnning as well!")
    var cmuser = "cmuser" + (i - 1);
    var imageuser = "image" + (i - 1);
    console.log(cmuser);
    console.log(imageuser);

    $("#"+cmuser).text("testing");
    $("#"+imageuser).setAttribute("src","/boy1.png");

}
        <%--var replyuser = "replyuser" + (i - 1) + "_" + j;--%>
        <%--$("#replyuer").innerHTML = ${sessionScope.username};--%>


    </script>

</head>
<body>

<!--should be normal nav bars-->

<div class="jumbotron text-center" style="margin-bottom:0; background-color: #eff5f5; ">
    <h1 style="color:dimgray;">Welcome to Randomos!</h1>
</div>
<header class="c-header" style="margin-top:5px; margin-bottom:10px">

    <nav class="navbar navbar-expand-sm bg-muted">
        <%--<div class="container">--%>
        <div class="c-header_menu col-lg-12 col-md-12 col-sm-12">
            <ul class="navbar-nav">
                <li>
                    <button type="button" class="btn btn-gray btn-lg" onclick="location.href='mainPage.jsp'"> Home
                    </button>
                </li>

                <div>
                    <c:choose>
                        <c:when test="${sessionScope.username!= null}">

                            <li>
                                <form action="logout" method="get">
                                    <button type="submit" class="btn btn-info btn-lg">Log out</button>
                                </form>
                            </li>

                            <li>
                                <form action="userinfo" method="get">
                                    <button type="submit" class="btn btn-info btn-lg">My Profile</button>
                                </form>
                            </li>


                        </c:when>
                        <%--<a class="nav-link text-muted" href="mainPage.jsp" onclick="destroySess()"> Logout </a>--%>
                        <c:otherwise>
                            <li>
                                <button type="button" class="btn btn-gray btn-lg"
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
                        <button type="button" class="btn btn-gray btn-lg" onclick="location.href='reg.jsp'">
                            Register
                        </button>
                    </li>

                </div>

                </c:when>
                <c:otherwise>
                    <li>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                            Create New Posts!
                        </button>
                    </li>

                    <li>
                            <%--servlet for retrieving your posts needed--%>
                        <form action="#" method="get">
                            <button type="submit" class="btn btn-info btn-lg">Browse Your Posts</button>
                        </form>
                    </li>
                </c:otherwise>
                </c:choose>

            </ul>
        </div>
        <%--</div>--%>
    </nav>

    <div>

    </div>

</header>
<!---->

<div class="container">
    <div class="row">
        <div class="header">
            <!--<div class="triangulo"></div>-->
            <div class="profile">
                <!--to add the profile imgs -->
                <img class='card-img-top img-thumbnail rounded-circle boarder-primary' src='images/icons/666201.png'
                     alt='Card image cap' style='width: 150px;height: 150px;'>
                <span class="name-author">${sessionScope.username}</span>
            </div>
            <h2 class="title"></h2>
        </div>
        <div></div>
    </div>

    <!-- INFO -->
    <div class="row">
        <div class="col-lg-12 mx-5 ">
            <h2 style="line-height: 25px;">${newPost.title} </h2>
            <br/>
            <h4 style="line-height: 25px;">Date: 30/01/2019</h4>
        </div>
    </div>
    <div class="row m-auto">
        <div class="col-lg-8 text m-auto">
            <p><br/><br/><br/>${newPost.post} </p>
        </div>

    </div>
</div>

<br/>
<br/>


<div class="row">
    <div class="col-lg-8 col-sm-8 col-md-8 m-auto">
        <div class="form-group">
            <label for="comment">Your Comment:</label>
            <textarea class="form-control" rows="5" id="comment" name="comment"></textarea>
        </div>
        <button type="submit" class="btn btn-info btn-lg float-right" onclick="addcomment('${newPost.postId}')"><strong>Comment</strong>
        </button>
    </div>
</div>
<br/>
<br/>
<br/>

<div class="row">
    <ul id="cmList${newPost.postId}" class="col-lg-8 m-auto">
    </ul>
</div>

<div class="jumbotron bg-dark jumbotron-fluid">
    <img class="img-responsive mx-auto d-block" src="" width="600">
</div>

-----------------------------------------------------
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
                <%--send to addPost servlet--%>
                <form action="addPost" method="post">
                    <%--send to servlet and build the post using this page.--%>
                    <div class="form-group">
                        <label for="title"><strong> Your Title:</strong></label>
                        <input type="text" class="form-control" id="title" name="title"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="post"></label>
                        <textarea class="form-control" rows="20" id="post" name="post"
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


