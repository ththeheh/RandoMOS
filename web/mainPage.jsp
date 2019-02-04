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

</head>

//to be tested.
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

<%--<div class="container">--%>
<%--<div class="spinner-border text-muted"></div>--%>
<%--<div class="spinner-border text-primary"></div>--%>
<%--<div class="spinner-border text-success"></div>--%>
<%--<div class="spinner-border text-info"></div>--%>
<%--<div class="spinner-border text-warning"></div>--%>
<%--<div class="spinner-border text-danger"></div>--%>
<%--<div class="spinner-border text-secondary"></div>--%>
<%--<div class="spinner-border text-dark"></div>--%>
<%--<div class="spinner-border text-light"></div>--%>
<%--</div>--%>

<div class="jumbotron text-center" style="margin-bottom:0; background-color: #eff5f5; ">
    <h1 style="color:dimgray;">Welcome to Randomos! </h1>
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
                        <button type="button" class="btn btn-gray btn-lg" onclick="location.href='reg.html'">
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
                    <form action="#" method="get">
                        <button type="submit" class="btn btn-info btn-lg">Browse Your Posts</button>
                    </form>
                </li>
            </ul>
        </div>
            <%--</div>--%>
    </nav>


        <%--modal starts here--%>
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


    </c:otherwise>
    </c:choose>


</header>


<div class="container">
    <div class="row mb-5">
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
