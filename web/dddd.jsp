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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script type="text/javascript" src="article.js"></script>


    <style>
        .btn {
            background-color: #e6ffe6;
            text-align: center;
            border: none;
            color: white;
            padding-top: 0.25em;
            padding-bottom: 0.25em;
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
            color: #adddcf;
            border: 1px solid #adddcf;
            float: right;
        }

        .btn:hover {
            background-color: #eff5f5;
            color: #024a26;
        }

        .button {
            background-color: #e6ffe6;
            width: 100%;
            text-align: center;
            border: none;
            color: white;
            padding: auto;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            -webkit-transition-duration: 0.4s;
            transition-duration: 0.4s;
            cursor: pointer;
        }

        .button {
            background-color: white;
            color: #adddcf;
            border: 1px solid #adddcf;
            border-radius: 15px;
        }

        .button:hover {
            background-color: #eff5f5;
            color: #024a26;
        }

        .article-load {
            margin-top: 2em;
            background-color: white
        }

        .article1 {
            margin: 10px;
            padding: 20px;
            border: 1px solid #adddcf;
            border-radius: 10px;
        }

        #articles, articleList {
            grid-area: articles;
        }

        /*textarea {*/

        .column {

            margin: 0px;
            height: auto;
            max-width: 100%;

        }

        .panel {

            max-width: 100%;
            height: auto;
            padding: 15px;
            margin: 10px;
            border: 1px solid #adddcf;
            border-radius: 15px;
            color: #adddcf;
        }

        .panel > h2 {
            text-align: center;
        }

        body {
            background-color: white;
        }

        body > div {
            display: flex;
            justify-content: center;
        }

        .c-header {
            margin-top: 30px;
            margin-bottom: 10px;
            margin-right: 20px;
        }

        .c-header ul {
            display: inline-block;
            height: 40px;
            float: right;
            padding: 20px;
        }

        div.sticky {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            background-color: #eff5f5;
            opacity: 0.8;
            padding: 0px;
            font-size: 20px;
        }

        div .column-left image {
            width: 100%;
            height: auto;
        }

        .grid-container {
            margin: auto;
            display: grid;
            grid-template-columns: auto auto auto auto;
            grid-gap: 10px;
            border: 1px;
            padding: 10px;
        }

        .grid-container > .article_thumb {

            text-align: center;
            padding: 20px 0px 0px 20px;
            font-size: 30px;
        }

    </style>
</head>

<body>

<c:if test="${stop!=true}">
    <jsp:include page="/showMain"/>
</c:if>
<div class="sticky">
    <header class="c-header">

        <div class="row">

            <div class="c-header_menu col-lg-12 col-md-12 col-sm-12">

                <ul class="navbar-nav ">

                    <li><h1 style="color:dimgray; text-align: center;">Design for travel</h1></li>

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
                                Create New articles!
                            </button>
                        </li>

                        <li>
                                <%--servlet for retrieving your articles needed--%>
                            <form action="#" method="get">
                                <button type="submit" class="btn btn-sm btn-info btn-lg">Browse Your articles</button>
                            </form>
                        </li>
                    </c:otherwise>
                    </c:choose>

                </ul>
            </div>
        </div>
    </header>
</div>


<%---------------------------------articles-------------------------------------------------------%>


<div class="container">

    <div id="articleList" class="panel33" style="color:dimgray;">

            <c:forEach items="${posts}" var="post">

                <div class="article3">
                    <div class="row">
                        <div class="col-6" >

                            <img src='${post.iconPath}' class="rounded" width="100" height="100">
                        </div>


                        <div class="col-6">
                            <h2 style="color:#527a67;">${post.title} </h2>
                            <h5 style="color:#527a67;">by ${post.userName}</h5>
                        </div>
                    </div>
                    </c:forEach>

                </div>

    </div>

</div>


<%-------------------------------------------------modal-----------------------------%>

<div class="modal" id="myModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">You can write your article here!
                </h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form action="addarticle" method="article">
                    <%--send to servlet and build the article using this page.--%>
                    <div class="form-group">
                        <label for="title"><strong> Your Title:</strong></label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>

                    <div class="form-group">
                        <label for="article"></label>
                        <textarea class="form-control" rows="20" id="article" name="article"
                                  placeholder="Put your article content here..."></textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg" onclick="iconupdate()">
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
