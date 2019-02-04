<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"
          xmlns:font-size="http://www.w3.org/1999/xhtml">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

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

<c:if test="${usernameinfo=='Not exist'}">
    <script>alert("This account does not exit! Please double check or you have to register a new account!")</script>
</c:if>

<c:if test="${usernameinfo=='Not match'}">
    <script>alert("Your username and password do not match, please reenter!")</script>
</c:if>

<div class="container">
    <div class="col-lg-6 col-md-8 col-sm-8 my-5" style="margin: auto ">
        <div class="card" style="background:#eff5f5">
            <div class="card-header" style="background-color: #eff5f5;">
                <h3 style="color:dimgray;">Log In</h3>
            </div>
            <div class="card-body">

                <!--use form for user input-->
                <form action="loginData" method="POST">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" style="background-color: #eff5f5;"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="username" name="username">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" style="background-color: #eff5f5;"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" class="form-control" placeholder="password" name="password">
                    </div>
                    <div class="row align-items-center remember" style="color:dimgray;">
                        <input type="checkbox"> &nbsp Remember Me
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Login" class="btn float-right login_btn btn-grey" style="color:dimgray;">
                    </div>
                </form>
            </div>
            <div class="card-footer" style="background-color: #eff5f5;">
                <div class="justify-content-center links" style="color:dimgray;">
                    Don't have an account?<a href="reg.html"> &nbsp Create account</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>