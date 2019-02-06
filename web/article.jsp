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
            float: right;
        }

        .btn:hover {
            background-color: #eff5f5;
            color: #024a26;
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

        .article1 {
            width: 900px;
            height: 1200px;
            padding: 30px;
            border: 1px solid lightgray;
        }

        .article2 {
            width: 900px;
            height: 300px;
            padding: 10px;
            border: 1px solid lightgray;
        }

        .column {
            float: left;
            padding: 10px;
            height: 300px;
        }

        .left {
            width: 25%;
        }

        .middle {
            width: 15%;
        }

        .right {
            width: 60%;
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


<script>

    $(document).ready(function () {
        var postUserName = $('#usernamepost').text();

        $.ajax({
            type: 'POST',
            url: 'postDeleteEdit',
            data: {'postUserName': postUserName},
            async: true,
            dataType: 'text',
            success: function (succ) {
                console.log(succ);
                if (succ === "success") {
                    // console.log(userJson);
                    div1 = document.createElement('div');

                    div1.innerHTML = " <button type='button' class='btn btn-sm btn-primary' data-toggle='modal' data-target='#editModal'>Edit Post </button>";

                    div2 = document.createElement('div');

                    div2.innerHTML = " <form action='deletePost' method='POST'> <button type='button' name='deletepostid' value ='${newPost.postId}' class='btn btn-sm btn-danger'> Delete </button></form>";
                    // var id = testlist+i;

                    document.getElementsByClassName("postbody")[0].appendChild(div1);
                    document.getElementsByClassName("postbody")[0].appendChild(div2);

                    <%--console.log('${newPost.title}');--%>

                    document.getElementById("edittitle").setAttribute("value", "${newPost.title}");
                    document.getElementById("editpost").innerText="${newPost.post}";


                    // console.log("list" + list);
                }
            },

            error: function (xhr, status) {
                console.log("fail");
                alert(xhr.status);
            }
        })
    })


</script>


<body>


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
                                    data-target="#postModal">
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
        </div>
    </header>
</div>


<%---------------------------------articles-------------------------------------------------------%>


<div class="container">

    <%----display a full article-------------------%>
    <div class="row mb-5">
        <div class="article1">

            <%--article information start----------------------%>
            <div class="articleInfo">

                <%--user icon--%>
                <div class="row">

                    <!--<div class="triangulo"></div>-->
                    <div class="col-lg3">
                        <img class='card-img-top img-thumbnail rounded-circle boarder-primary'
                             src='${iconPath}'
                             alt='Card image cap' style='width: 40px;height: 40px;'>
                        <span id="usernamepost" class="name-author">${sessionScope.username}</span>
                    </div>
                    <%--user icon end--%>

                    <%--date start--%>
                    <div class="col-lg-9 mx-5 ">
                        <h4 style="font-size: small; color: dimgray">${newPost.title} Title here</h4>
                        <h4 style="font-size: small; color: dimgray">Date: 6/02/2019</h4>
                    </div>
                </div>
                <%--date end--%>

                <%--postid start--%>
                <%----%>
                <%--<div class="row m-auto">--%>
                <%----%>
                <%--<div class="col-lg-8 text m-auto">--%>
                <%--<p><br/><br/><br/></p>--%>
                <%----%>
                <%--</div>--%>
                <%----%>
                <%--</div>--%>
                <%--postid end--%>
                <%----article information end------------------------------%>


            </div>

            <div class="postbody">
                <h2 style="color:dimgray;">Article </h2>

                <div class="image" style="margin-bottom: 15px">
                    <img src="https://media.allure.com/photos/5bf1b1502ab5072a91e1853a/16:9/w_1200%2Cc_limit/travel%20editor%20favorite%20products.jpg"
                         width="850" height="500">
                </div>


                <p style="color: dimgray;">This is the post from the database. ${newPost.post}.
                    Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien
                    This is the
                    third paragraph.
                    Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the
                    third
                    paragraph.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.
                    Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the
                    third
                    paragraph.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.
                    Euismod lectus eros, nec feugiat magna ultricies a. Suspendisse et sapien This is the
                    third
                    paragraph.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod lectus.</p>
            </div>

            <%-------------------------comment start----------------------------------%>

            <div class="row" style="margin-top: 20px;">
                <div class="col-lg-11 col-sm-8 col-md-8 m-auto">
                    <div class="form-group">
                        <label for="comment" style="color: dimgray;">Your Comment:</label>
                        <textarea class="form-control" rows="5" id="comment" name="comment"></textarea>
                    </div>
                    <button type="submit" class="btn btn-info btn-lg float-right"
                            onclick="addcomment('${newPost.postId}')"><strong>Comment</strong>
                    </button>
                </div>
            </div>

            <div class="row">
                <ul id="cmList${newPost.postId}" class="col-lg-8 m-auto">
                </ul>
            </div>
            <%---------------------------comment end-------------------------------------------%>

        </div>
    </div>


    <%--display thumbnamils of user's articles--%>
    <div class="row ">
        <div class="article2">
            <div class="grid-container">
                <div class="article_thumb ">
                    <div class="row top">
                        <img src="https://www.bcdtravel.com/move-global/wp-content/uploads/sites/142/Move_MarketMonitor_Spain_image_Aug2018.jpg"
                             width="240" height="200">
                    </div>
                    <div class="row middle"></div>

                    <div class="row bottom">
                        <h4 style="color:lightsteelblue; text-anchor: middle;"> &nbsp Passion in Spain </h4>

                    </div>
                </div>


                <div class="article_thumb">
                    <div class="row middle">
                        <img src="https://www.telegraph.co.uk/content/dam/Travel/2016/October/venice-tourists-AP-TRAVEL.jpg?imwidth=1400"
                             width="240" height="200">
                    </div>
                    <div class="row middle"></div>

                    <div class="row bottom">
                        <h4 style="color:lightsteelblue; text-align: -moz-center"> &nbsp Memories of Venice </h4>

                    </div>
                </div>

                <div class="article_thumb">
                    <div class="row bottom">
                        <img src="https://www.telegraph.co.uk/content/dam/Travel/2018/July/PAris-tourist-iStock-514717188.jpg?imwidth=1400"
                             width="240" height="200">
                    </div>
                    <div class="row middle"></div>

                    <div class="row bottom">
                        <h4 style="color:lightsteelblue; "> &nbsp Travel to Europe </h4>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%-------------------------------------------------modal for new post-----------------------------%>

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
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>

                    <div class="form-group">
                        <label for="post"></label>
                        <textarea class="form-control" rows="20" id="post" name="post"
                                  placeholder="Put your post content here..."></textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg"  onclick="iconupdate()">
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


<%-------------------------------------------------edit post modal-----------------------------%>

<div class="modal" id="editModal">
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
                <form action="editPost" method="post">
                    <%--send to servlet and build the post using this page.--%>
                    <div class="form-group">
                        <label for="title"><strong> Your Title:</strong></label>
                        <input type="text" class="form-control" id="edittitle" name="title" required>
                    </div>

                    <div class="form-group">
                        <label for="post"></label>
                        <textarea class="form-control" rows="20" id="editpost" name="post"
                                  placeholder="Put your post content here..."></textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit" name="postId" value="${newPost.postId}" class="btn btn-primary btn-lg" onclick="iconupdate()">
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
