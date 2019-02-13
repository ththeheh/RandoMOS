<%--This is the page for user to put new password.--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link href="${pageContext.request.contextPath}//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"
          xmlns:font-size="http://www.w3.org/1999/xhtml">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

    <style>
        input {
            background-color: #eff5f5;
            color: #024a26;
        }

        .fas {
            color:#ffa64d;
        }

    </style>

</head>
<body>

<c:if test="${usernameinfo=='Notexist'}">
    <script>alert("This account does not exit! Please double check or you have to register a new account!")</script>
</c:if>

<c:if test="${usernameinfo=='Notmatch'}">
    <script>alert("Your username and password do not match, please reenter!")</script>
</c:if>

<div class="container">
    <div class="col-lg-6 col-md-8 col-sm-8 my-5" style="margin: auto ">
        <div class="card" style="background:#eff5f5; width:900px;">

            <div class="card-header" style="background-color: #eff5f5;">
                <h3 style="color:dimgray;">Forgot your password?</h3>
            </div>
            <div class="card-body">
                <div class="row">
                <div class="col-lg-3 col-md-8 col-sm-12 my-5">
                    <div class="grid-item">
                        <img class="img-circle mx-5" style="width:100px; height:100px" id="featuredImage"
                             src="./images/Mail-Password-icon.png" alt="profile icon"/>
                    </div>
                </div>
                <div class="col-lg-4 col-md-8 col-sm-12 my-5">
                    <div class="grid-item">
                        <p> Enter your email or username. </p>
                        <p> We'll email instructions on how </p>
                        <p> to reset your password. </p>
                    </div>
                </div>
                <div class="col-lg-5 col-md-8 col-sm-12 my-5">
                    <!--use form for user input-->
                    <form action="newPassword" method="GET">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background-color: #eff5f5;"><i
                                        class="fas fa-user"></i></span>
                            <%--</div>--%>
                            <%--<input type="text" class="form-control" placeholder="username" name="username">--%>
                        <%--</div>--%>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background-color: #eff5f5;"><i
                                        class="fa fa-key"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="password" name="password">
                        </div>

                        <div class="form-group">
                            <input type="submit" value="submit" class="btn float-right login_btn btn-grey"
                                   style="color:dimgray;">
                        </div>


                    </form>
                </div>
            </div>
        </div>
        <div class="card-footer" style="background-color: #eff5f5;">

        </div>
    </div>
</div>
</div>
</body>
</html>