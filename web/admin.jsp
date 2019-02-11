<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile Display</title>
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

        .card {

            background: #eff5f5;

        }

        .card-footer {
            display: inline-block;
        }

        .grid-container {
            display: grid;
            grid-row-gap: 50px;

        }

        form, h6, h5 {
            color: dimgray;
        }

        input, select {
            border: 1px solid #cccccc;
            border-radius: 4px;
            /*resize: vertical;*/
        }

        #iconModal img {
            height: 100px;
            width: 100px;
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
            color: #047c40;
            border: 1.5px solid #047c40;
        }

        .btn:hover {
            background-color: #eff5f5;
            color: #024a26;
        }

    </style>
    <script>

    </script>

</head>
<body>


<div class="container">
    <div class="col-lg-8 col-md-8 col-sm-8 my-5" style="margin: auto">
        <div class="card">
            <div class="col-lg-6">
                <button type="button" class="btn btn-sm btn-gray btn-lg"
                        onclick="location.href='mainPage.jsp'">
                    Home
                </button>
            </div>
            <%--card header--%>
            <div class="card-header">

                <h3 style="color:dimgray;"> Administrator Page </h3>
            </div>
            <br>
            <div class="card-body">
                <br>
                <form action="batchAccs" method="post">
                    <p>Put batch registration info in the format: <em>username;password;first name;last
                        name;birthday(year-month-day);country;email;description; (no space between)</em></p>
                    <div class="form-group">
                        <textarea name="batchAccs" id="batchAccs" cols="60" rows="10"
                                  placeholder=""></textarea>"
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn" name="batchSubmit" value="Add Accounts"
                               style="color:green;border-radius: 15px">
                    </div>
                </form>
                <hr size="2">
                <h5> &nbsp; All the existing users:</h5>
                <ul>

                    <c:forEach items="${accounts}" var="acc">
                        <li>
                            <div class="col-lg-3">
                                <img src="${acc.iconPath}" alt="" style="width:50px;height: auto">
                            </div>
                            <div class="col-lg-6">
                                <h5>${acc.userName}</h5>
                                <p>${acc.firstName} ${acc.lastName}</p>
                            </div>
                        </li>

                        <form action="deleteAccount" method="post">
                            <div class="form-group">
                                <input type="hidden" value="${acc.userName}" name="userName">
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Delete This Account" class="btn" name="admin"
                                       style="color:red;border-radius: 15px">
                            </div>
                        </form>

                    </c:forEach>
                </ul>
            </div>


            <%--card body--%>

        </div>
    </div>
</div>


</body>
</html>