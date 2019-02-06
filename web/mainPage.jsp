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

        ul {
            float: right;
        }

        .navbar {
            z-index: 1;
        }

        .article {
            width: 900px;
            height: 400px;
            padding: 10px;
            border: 1px solid #adddcf;;
            border-radius: 1rem;
            z-index: -1;

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
            /*opacity:0.3;*/
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


    </style>


</head>


<script>
    <c:if test="${delete=='deleted'}" >
    alert("Your account is deleted! You are always welcomed to be back to RandoMOS!")
    </c:if>

    //to be done
    // console.log("this is running!")
    // $(document).ready(function () {
    //     alert("hi");
    //     $.ajax({
    //         type: 'POST',
    //         url: 'showMain',
    //         success: function (json) {
    //             alert("success");
    //         },
    //         error: function(xhr){
    //             alert(xhr);}
    //
    //     });


    // })

</script>


<%--<jsp:include page="/showMain" flush="true">--%>

<body>


<c:if test="${stop!=true}">
    <jsp:include page="/showMain"/>
</c:if>


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

    <%--<div class="col-6">--%>
    <c:forEach items="${posts}" var="post">
    <div class="row mb-5">

        <div class="article">
            <div class="row">
                <div class="col-6" style="overflow:auto;">

                    <img src='${post.iconPath}' class="rounded" width="100" height="100">
                </div>


                <div class="col-6">
                    <h2 style="color:#527a67;">${post.title} </h2>
                    <h5 style="color:#527a67;">by ${post.userName}</h5>
                </div>
                </c:forEach>

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
