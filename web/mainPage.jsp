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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://unpkg.com/gijgo@1.9.11/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


    <link href='https://fonts.googleapis.com/css?family=Euphoria+Script' rel='stylesheet' type='text/css'>


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
            color: #adddcf;
            border: 1.5px solid #adddcf;
            float: right;
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
        }

        /*.column {*/
        /*float : left;*/
        /*padding: 10px;*/
        /*height: 300px;*/
        /*}*/

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
            opacity: 1.0;
            z-index: 2;
            padding: 0px;
            font-size: 20px;
        }

        div .column-left image {
            width: 100%;
            height: auto;
        }

        .c-header {
            margin-bottom: 10px;
        }

        .card {
            border: 1px solid #adddcf;
            border-radius: 15px;
        }


    </style>


</head>


<script>
    <c:if test="${delete=='deleted'}" >
    alert("Your account is deleted! You are always welcomed to be back to RandoMOS!")
    </c:if>

    <c:if test="${stop!=true}">
    <jsp:include page="/showMain"/>;
    <%--<c:set var="${stop1}" value="true" />--%>
    </c:if>

</script>

<%--<jsp:include page="/showMain" flush="true">--%>

<body>



<div class="sticky">
    <header class="c-header">

        <div class="row">
            <nav class="navbar navbar-expand-sm bg-muted">

                <div class="c-header_menu col-lg-12 col-md-12 col-sm-12">

                    <ul class="navbar-nav">
                        <li><h1 style="color:#527a67; text-align: center;">Welcome to RandoMOS! </h1></li>

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
                                            <button type="submit" class="btn btn-sm btn-info btn-lg">Log out</button>
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
                                    <button type="submit" class="btn btn-sm btn-info btn-lg" name="userPost" value="true">Browse Your Posts</button>
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

<div class="container" style="z-index: -1">
<div style="height:60px"><h3 style="color:dodgerblue">Here are the latest 10 posts for you!</h3></div>

    <%--<div class="col-6">--%>
    <c:forEach items="${posts}" var="post">
        <div class="card">
            <div class="row">
                <div class="col-lg-3">
                    <img src="${post.iconPath}" alt="" style="width:50px;height: auto">
                </div>
                <div class="col-lg-6">
                    <p id="pcontent" style="color: lightseagreen;font-size:20px"><b>${post.title}</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;by ;&nbsp;&nbsp;&nbsp;&nbsp;${post.userName}</p>
                </div>
                <div class="col-lg-3">
                    <form action="showPost" method="POST">
                        <div class="form-group">
                            <input type="hidden" value="${post.postId}" name="postId">
                        </div>
                        <div class="form-group">
                            <input type="submit" value="loadPost" class="btn login_btn"
                                   style="color:lightseagreen;border-radius: 15px">
                        </div>
                    </form>
                </div>
            </div>

        </div>
        <br/>


    </c:forEach>

</div>


<%-------------------------------------------------modal-----------------------------%>

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
                    </div>

                    <%--wyswyg   sooo-------------------%>
                    <textarea id="editor" name="post"><div style="height:800px;width:auto"></div></textarea>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $("#editor").editor({
                                uiLibrary: 'bootstrap4'
                            });
                        });
                    </script>

                    <%--wyswyg   sooo-------------------%>

                    <%--<div class="form-group">--%>
                    <%--<label for="post"></label>--%>
                    <%--<textarea class="form-control" rows="20" id="post" name="post"--%>
                    <%--placeholder="Put your post content here..."></textarea>--%>
                    <%--</div>--%>
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
