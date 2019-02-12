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

    <%--from https://gijgo.com/--%>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script type="text/javascript" src="post.js"></script>


    <%--WYSIWYG --%>


    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://unpkg.com/gijgo@1.9.11/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


    <link href='https://fonts.googleapis.com/css?family=Euphoria+Script' rel='stylesheet' type='text/css'>


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
            border-radius: 15px;
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

        textarea {
            height: 600px;
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

        .post-load {
            margin-top: 2em;
            background-color: white
        }

        .post1 {
            margin: 10px;
            padding: 20px;
            width: 850px;
            height: auto;
            border: 1px solid #adddcf;
            border-radius: 10px;
        }

        #posts, postList {
            grid-area: posts;
        }

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
            opacity: 0.9;
            padding: 0px;
            font-size: 20px;
            background: #eff5f5 url("images/randomos.jpg");
            background-size: 600px;
            height: 100px;
        }

        div .column-left image {
            width: 100%;
            height: auto;
        }

        .grid-container > .post_thumb {

            text-align: center;
            padding: 20px 0px 0px 20px;
            font-size: 30px;
        }

        .navbar-nav li {
            float: right;
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
        $("#postdateedit").attr("value", today);
        console.log(today);
    });

    $("#postModal").on('shown', function () {
        $("#postModal").val("");
    });

    $("#postModal").on('shown', function () {
        $("#postModal").val("");
    });



    $(document).ready(function () {
        var postUserName = $('#usernamepost').text();

        console.log($('#usernamepost').text());
        console.log("${sessionScope.username}");
        if ('${sessionScope.username}'.length) { //to continue
// if (false ) {

            console.log("this is running!");
            $.ajax({
                type: 'post',
                url: 'postDeleteEdit',
                data: {'postUserName': postUserName},
                // async: true,
                dataType: 'text',
                success: function (succ) {

                    console.log(succ);

                    if (succ === "success") {
// console.log(userJson);
                        div1 = document.createElement('div');

                        div1.innerHTML = " <button type='button' class='btn btn-sm btn-primary' data-toggle='modal' data-target='#editModal'>Edit post </button>";

                        div2 = document.createElement('div');

                        div2.innerHTML = " <form action='deletePost' method='post'> <button type='submit' name='deletepostid' value ='${post.postId}' class='btn btn-sm btn-danger'> Delete </button></form>";
// var id = testlist+i;

                        document.getElementsByClassName("postbody")[0].appendChild(div1);
                        document.getElementsByClassName("postbody")[0].appendChild(div2);

                        <%--console.log('${post.title}');--%>

                        document.getElementById("edittitle").setAttribute("value", "${post.title}");
                        document.getElementById("editpostContent").innerHTML = "<div>" + '${post.post}' + "</div>";

// console.log("list" + list);
                    }
                },

                error: function (xhr, status) {
                    console.log("fail");
                    alert(xhr.status);
                }
            })
        }
    })


    function showCMDelete(i) {
        var cmuser = "cmuser" + i;
        console.log("this is the cmuser from show function" + cmuser);
        console.log("this is the session" + '${sessionScope.username}');
        console.log("this is the cmuser" + $("#" + cmuser).text());

        console.log("delete is not supposed to be shown");

        if ($("#" + cmuser).text() === '${sessionScope.username}') {
            var deleteCm = "delete" + i;
            console.log("delete comment id " + deleteCm);
            $("#" + deleteCm).css("visibility", "visible");
        }
    }



    function showRPDelete(j) {

        var replyuser = "replyuser" +(j);
        console.log("session"+'${sessionScope.username}');
        console.log($("#"+replyuser).text() === '${sessionScope.username}');
        if ($("#"+replyuser).text() === '${sessionScope.username}') {
            console.log("why is this runnin?");
            var deleteRep = "delete" + j;
            $("#" + deleteRep).css("visibility", "visible");

        }
    }

    function showCMReply(i) {
        var cmuser = "cmuser" + i;
        console.log("this is the session username"+'${sessionScope.username}');
        console.log('${sessionScope.username}'.length!==0);
        if ('${sessionScope.username}'.length!==0) {
            var replyCm = "submit" + i;
            $("#" + replyCm).css("visibility", "visible");
        }
    }

    function showRPReply(j) {

        var replyuser = "replyuser" + j;

        if ('${sessionScope.username}'.length!==0) {
            var replyRep = "submit" + j;
            $("#" + replyRep).css("visibility", "visible");
        }
    }

    function deleteCM(i) {
        $("#" + "commentdiv" + i).remove();
        $("#" + "list" + i).remove();

        $.ajax({
            type: 'post',
            url: 'deleteComment',
            data: {'postId': '${post.postId}', 'commentId': i},
            async: true,
            dataType: 'text',
            success: function (succ) {
// console.log(userJson);
                alert("Comment deleted!");
            },
            error: function (xhr, status) {
                alert(xhr.status);
            }

        })

    }

    function deleteReply(id) {
        $("#" + "replydiv" + id).remove();
        $.ajax({
            type: 'post',
            url: 'deleteReply',
            data: {'postId': '${post.postId}', 'replyId': id},
            async: true,
            dataType: 'text',
            success: function (succ) {
// console.log(userJson);
                alert("Reply deleted!");
            },
            error: function (xhr, status) {
                alert(xhr.status);
            }

        })
    }

    $(document).ready(function () {
        //show comment button

        if ('${sessionScope.username}'.length!==0) {
            $('#commentdiv').css("visibility", "visible");
        }

        <%--console.log('${show}');--%>
        var i = 1;
        var j = 1000000;

        if ('${show}' === 'true') { //this is going to show all the comments and replies
            console.log("the comments size is " + '${post.comments.size()}'); //this is working
//el show number with '' is number.
            <%--if ('${post.comments.size()}'.length) {--%>
            <%--for (var i = 1; i <=${post.comments.size()}; i++) {--%>
            <c:forEach items="${post.comments}" var="comment">
            console.log('${comment.comment}');
            <%--console.log("this is the first comment"+'${comment.comment}');--%>
            addcomment(${post.postId}, true);
            console.log("${comment.iconPath}");
            $("#" + "image" + i).attr("src", "${comment.iconPath}");
            $("#" + "cmuser" + i).text("${comment.userName}");
            $("#" + "CMContent" + i).text("${comment.comment}");
            // console.log("this is running");
            <%--console.log(${comment.replies.size()});--%>
            <%--console.log("the replies size is " + '${comment.replies.size()}'); //this is working--%>
            console.log("this is i from show post  :" + i);
            console.log("this is text" + $("#" + "cmuser" + i).text());
            showCMDelete(i);
            showCMReply(i);

            <c:forEach items="${comment.replies}" var="reply">
            addReply(i, j, ${post.postId}, true);
            $("#" + "image" + j).attr("src", '${reply.iconPath}');
            $("#" + "replyuser" + j).text('${reply.userName}');
            $("#" + "RPContent" + j).text('${reply.comment}');
            <%--}--%>
            <%--}--%>
            showRPDelete(j);
            showRPReply(j);
            j++;

            </c:forEach>
            i++;
            </c:forEach>
        }
    })


    $(function () {
        $('#editControls a').click(function (e) {
            switch ($(this).data('role')) {
                case 'h1':
                case 'h2':
                case 'p':
                    document.execCommand('formatBlock', false, $(this).data('role'));
                    break;
                default:
                    document.execCommand($(this).data('role'), false, null);
                    break;
            }

        });
    });


</script>

<script type="text/javascript" src="post.js"></script>

<script type="text/javascript" src="../lib/jquery-3.3.1.js"></script>

<body>


<div class="sticky">

    <div class="row">
        <nav class="navbar navbar-expand-sm bg-muted">

            <div class="c-header_menu col-lg-12 col-md-12 col-sm-12">

                <ul class="navbar-nav ">


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
                                <li>
                                    <button type="button" class="btn btn-sm btn-primary" data-toggle="modal"
                                            data-target="#postModal">
                                        Create New posts!
                                    </button>
                                </li>

                                <li>                                            <%--servlet for retrieving your posts needed--%>
                                    <form action="showMain" method="get">
                                        <button type="submit" class="btn btn-sm btn-info btn-lg">Browse Your posts
                                        </button>
                                    </form>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <button type="button" class="btn btn-sm btn-gray btn-lg"
                                            onclick="location.href='loginPage.jsp'">
                                        Login
                                    </button>
                                </li>
                            </c:otherwise>
                        </c:choose>
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
                    </c:choose>

                </ul>
            </div>
        </nav>
    </div>
</div>


<%---------------------------------posts-------------------------------------------------------%>


<div class="container">

    <%----display a full post-------------------%>
    <div class="row mb-5">
        <div class="post1">

            <%--post information start----------------------%>
            <div class="postInfo" style="visibility: visible">

                <%--user icon--%>
                <div class="row">

                    <!--<div class="triangulo"></div>-->
                    <div class="col-lg3">
                        <img class='card-img-top img-thumbnail rounded-circle boarder-primary'
                             src='${post.iconPath}'
                             alt='Card image cap' style='width: 40px;height: 40px;'>
                        <span id="usernamepost" class="name-author">${post.userName}</span>
                    </div>
                    <h2 class="title"></h2>
                    <%--user icon end--%>

                    <%--date start--%>
                    <div class="col-lg-9 mx-5 ">
                        <h4 style="font-size: small; color: dimgray">${post.title}</h4>
                        <h4 style="font-size: small; color: dimgray">Date: ${post.date}</h4>
                    </div>
                </div>
            </div>

            <div class="postbody">
                <h2 style="color:dimgray;">${post.title}</h2>

                <div id="postList" class="panel" style="color:dimgray;">
                    <%--load posts here--%>
                    ${post.post}
                </div>

            </div>

            <%-------------------------comment start----------------------------------%>

            <div class="row" id="commentdiv" style="margin-top: 20px;visibility: hidden">
                <div class="col-lg-11 col-sm-8 col-md-8 m-auto">
                    <div class="form-group">
                        <label for="comment" style="color: dimgray;">Your Comment:</label>
                        <textarea class="form-control" rows="5" id="comment" name="comment"></textarea>
                    </div>
                    <button type="submit" class="btn btn-info btn-lg float-right"
                            onclick="addcomment('${post.postId}',false)">Comment
                    </button>
                </div>
            </div>

            <div class="row">
                <ul id="cmList${post.postId}" class="col-lg-8 m-auto">
                </ul>
            </div>
            <%---------------------------comment end-------------------------------------------%>

        </div>
    </div>
    <%--------------------------added--%>
    <div id="listpost" class="panel">
        <h4 style="color:#FFA07A">Explore your memories</h4>


        <div class="column ">

            <div id="posts" style="color:dimgray;">
                <div id="post-load-button" class="post-load button">Load more posts</div>
            </div>


        </div>


    </div>
    <%---------------------added--%>


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
                        <input type="text" class="form-control" id="title" name="title"
                               placeholder="Put your title here..." required>
                        <label for="postdate"></label>
                        <input type="date" class="form-control" id="postdate" name="date" value="" required>

                    </div>
                    <%--wyswyg   sooo-------------------%>
                    <textarea id="editor" name="post"><div style="height: 400px;"
                                                           aria-placeholder="The characters are limited to 1000."></div></textarea>
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
                        <input type="text" class="form-control" id="edittitle" name="title"
                               placeholder="Put your title here..." required>
                        <label for="postdateedit"></label>
                        <input type="date" class="form-control" id="postdateedit" name="date" value="" required>

                    </div>

                    <textarea id="editpost" name="post"><div id="editpostContent"
                                                             style="height: 400px;"></div></textarea>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $("#editpost").editor({
                                uiLibrary: 'bootstrap4'
                            });
                        });
                    </script>
                    <div class="form-group">
                        <button type="submit" name="postId" value="${post.postId}" class="btn btn-primary btn-lg"
                                onclick="">
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
