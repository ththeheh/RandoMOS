<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>RandoMOS </title>
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
            integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://unpkg.com/gijgo@1.9.11/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <%--popper.js--%>

    <link href='https://fonts.googleapis.com/css?family=Euphoria+Script' rel='stylesheet' type='text/css'>


    <style>

        body {
            background-image: url("/images/sea.jpg");
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
            color: #adddcf;
            border: 1.5px solid #adddcf;
            border-radius: 15px;
            float: right;
        }

        button {
            background-color: white;
            color: #adddcf;
            border: 1px solid #adddcf;
            border-radius: 15px;
        }

        button:hover {
            background-color: #eff5f5;
            color: #024a26;
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

        #pcontent {
            color: dimgray;
            z-index: -1;
        }

        ul {
            float: right;
        }

        .navbar {
            z-index: 1;
            background-color: white;
        }

        div.sticky {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            background-color: #eff5f5;
            opacity: 1.0;
            z-index: 2;
            padding: 0px;
            font-size: 20px;
        }

        div .column-left image {
            width: 100%;
            height: auto;
        }

        .card {
            border: 1px solid #adddcf;
            border-radius: 15px;
        }

        nav input[type=text] {
            padding: 10px;
            margin-top: 10px;
            font-size: 15px;
            height: 30px;
            border-width: 1px;
            border-radius: 15px;
            border-color: black;
        }

        nav .search-container {
            float: right;
        }

        header{
            background-color: white;
        }


    </style>


</head>


<script>

    $(document).ready(function () {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();

        if (dd < 10) {
            dd = '0' + dd
        }

        if (mm < 10) {
            mm = '0' + mm
        }
        today = yyyy + '-' + mm + '-' + dd;
        $("#postdate").attr("value", today);
        console.log(today);
    });


    <c:if test="${delete=='deleted'}" >
    alert("Your account is deleted! You are always welcomed to be back to RandoMOS!")
    </c:if>

    <c:if test="${stop!=true}">
    <jsp:include page="/showMain"/>;
    </c:if>

</script>


<body>

<div class="sticky">
    <header class="header">
        <div class="row">
            <img src="images/randomos.jpg" style="height: 150px;border:1px;" class="mx-3">
            <nav class="navbar navbar-expand-sm bg-muted">

                <div class="c-header_menu col-lg-12 col-md-12 col-sm-12">

                    <ul class="navbar-nav">
                        <li>
                            <button type="button" class="btn btn-sm btn-gray btn-lg"
                                    onclick="location.href='mainPage.jsp'">
                                Home
                            </button>
                        </li>
                        <div>
                            <c:choose>
                                <c:when test="${sessionScope.username!= null}">

                                    <li>
                                        <form action="logout" method="get">
                                            <button type="submit" class="btn btn-sm btn-info btn-lg">Log out
                                            </button>
                                        </form>
                                    </li>

                                    <li>
                                        <form action="userinfo" method="get">
                                            <button type="submit" class="btn  btn-sm btn-info btn-lg">My Profile
                                            </button>
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
                                <button type="button" class="btn btn-sm btn-gray btn-lg"
                                        onclick="location.href='reg.jsp'">
                                    Register
                                </button>
                            </li>

                        </div>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <button type="button" class="btn btn-sm btn-primary" data-toggle="modal"
                                        data-target="#postModal">
                                    Create New Posts!
                                </button>
                            </li>

                            <li>

                                    <%--servlet for retrieving your posts needed--%>
                                <form action="showMain" method="get">
                                    <button type="submit" class="btn btn-sm btn-info btn-lg" name="userPost"
                                            value="true">Browse Your Posts
                                    </button>
                                </form>
                            </li>
                        </c:otherwise>

                        </c:choose>
                        <c:if test="${sessionScope.admin==true}">
                            <li>
                                    <%--servlet for retrieving your posts needed--%>
                                <form action="admin" method="get">
                                    <button type="submit" class="btn btn-sm btn-primary" name="Admin"
                                            value="true">Admin Page
                                    </button>
                                </form>
                            </li>
                        </c:if>
                    </ul>
                </div>
                <%--advanced feature nav-bar search--%>
                <div class="search-container col-lg-2 col-md-4 col-sm-6">

                    <form action="search" method="GET">
                        <div class="row">
                            <input type="text" placeholder="Search.." name="keyWord" style="color: #adddcf ">
                            <button type="submit" class="btn-sm float-right m-1" style="border-radius: 15px;">Go!
                            </button>
                        </div>
                    </form>

                </div>

            </nav>
        </div>
    </header>
</div>

<%---------------------------------forum-------------------------------------------------------%>
<div class="content">
    <div class="row">
    <div class="dropdown m-5">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
            Sort By:
        </button>
        <div class="dropdown-menu">
            <a class="dropdown-item" href="sort?sort=title&order=${order}">Title</a>
            <a class="dropdown-item" href="sort?sort=username&order=${order}">Username</a>
            <a class="dropdown-item" href="sort?sort=date&order=${order}">Date</a>
        </div>
    </div>
    </div>


    <div class="container" style="z-index: -1">
        <c:forEach items="${posts}" var="post">
            <div class="card">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-5 mx-2 mt-2">
                        <img src="${post.iconPath}" alt="" style="width:50px;height: auto">
                        <p>${post.date}</p>
                    </div>
                    <div class="col-lg-5 col-md-8 col-sm-10  mt-4">
                        <p id="pcontent" style="color: lightseagreen;font-size:20px"><b>${post.title}</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            by
                            &nbsp;&nbsp;&nbsp;&nbsp;${post.userName}</p>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-5  mt-4">
                        <form action="showPost" method="POST">
                            <div class="form-group">
                                <input type="hidden" value="${post.postId}" name="postId">
                            </div>
                            <div class="form-group mx-4">
                                <input type="submit" value="loadPost" class="btn"
                                       style="color:lightseagreen;border-radius: 15px">
                                <c:if test="${sessionScope.admin==true}">
                                    <h4 style="color: plum;">${post.vis}</h4>
                                    <div class="dropdown m-5">
                                        <button class="btn btn-secondary dropdown-toggle" type="button"
                                                data-toggle="dropdown"
                                                aria-haspopup="true" aria-expanded="false">
                                            Show or Hide:
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item"
                                               href="postVis?vis=yes&postId=${post.postId}">Show</a>
                                            <a class="dropdown-item"
                                               href="postVis?vis=no&postId=${post.postId}">Hide</a>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
            <br/>
        </c:forEach>
    </div>
</div>

<%------------------------------------------------- post modal-----------------------------%>

<div class="modal" id="postModal">
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
                <form action="addPost" method="post">
                    <%--send to servlet and build the post using this page.--%>
                    <div class="form-group">
                        <label for="title"><strong> Your Title:</strong></label>
                        <input type="text" class="form-control" id="title" name="title"
                               placeholder="Put your title here..." required>
                        <label for="postdate"></label>
                        <input type="date" class="form-control" id="postdate" name="date" value="" required>

                    </div>

                    <%--wyswyg   soo-------------------%>
                    <textarea id="editor" name="post"><div style="height:800px;width:auto"></div></textarea>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $("#editor").editor({
                                uiLibrary: 'bootstrap4'
                            });
                        });
                    </script>

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
