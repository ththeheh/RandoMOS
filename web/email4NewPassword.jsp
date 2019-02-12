<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>


<head>


    <title>Login Page</title>
    <link href="${pageContext.request.contextPath}//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          rel="stylesheet" id="bootstrap-css"
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
            color: #ffa64d;
        }

        image {
            -webkit-filter: hue-rotate(90deg); /* Safari */
            filter: hue-rotate(90deg);
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
        <div class="card" style="background:#eff5f5; width:900px;">

            <div class="card-header" style="background-color: #eff5f5;">
                <h3 style="color:dimgray;">Forgot your password?</h3>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-3 col-md-8 col-sm-12 my-5">

                        <img class="img-circle mx-5" style="width:150px; height:150px;" id="featuredImage"
                             src="../images/Mail-Password-icon.png" alt="profile icon"/>

                    </div>
                    <div class="col-lg-4 col-md-8 col-sm-12 my-5">

                        <p> Enter your email or username. </p>
                        <p> We'll email instructions on how </p>
                        <p> to reset your password. </p>

                    </div>
                    <div class="col-lg-5 col-md-8 col-sm-12 my-5">
                        <!--use form for user input-->
                        <form action="resetPassword" method="GET">
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                <span class="input-group-text" style="background-color: #eff5f5;"><i
                                        class="fa fa-envelope-o"></i></span>
                                </div>
                                <input type="text" class="form-control" placeholder="username" name="username">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="email" name="email">
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Submit"
                                       class="btn float-right login_btn btn-grey btn-outline-secondary"
                                       style="color:#024a26;" onclick="alert('A password reset link will be sent to your email, please have a check!')">
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