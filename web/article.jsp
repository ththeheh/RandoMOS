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
    <script type="text/javascript" src="post.js"></script>


    <%--WYSIWYG --%>

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
            width:850px;
            height:auto;
            border: 1px solid #adddcf;
            border-radius: 10px;
        }

        #posts, postList {
            grid-area: posts;
        }

        /*textarea {*/

        /*background-color: white;*/
        /*color: #adddcf;*/
        /*border: 1px solid #adddcf;*/
        /*border-radius: 15px;*/

        /*width: 100%;*/
        /*height: 150px;*/
        /*padding: 12px 20px;*/
        /*box-sizing: border-box;*/
        /*resize: none;*/
        /*}*/

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
            margin: auto;
            display: grid;
            grid-template-columns: auto auto auto auto;
            grid-gap: 10px;
            border: 1px;
            padding: 10px;
        }

        .grid-container > .post_thumb {

            text-align: center;
            padding: 20px 0px 0px 20px;
            font-size: 30px;
        }

        /*for WYSIWYG*/
        #post {
            resize: vertical;
            overflow: auto;
            border: 1px solid silver;
            border-radius: 5px;
            min-height: 100px;
            box-shadow: inset 0 0 10px silver;
            padding: 1em;
            background: white;
            margin: 0 auto;
            width: 90%;
        }

        .navbar-nav li {
            float: right;
        }

    </style>
</head>
<script>

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
                async: true,
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
                        document.getElementById("editpost").innerText = "${post.post}";

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
        console.log("this is the session" + '${sessionScope.username}')
        if ($("#" + cmuser).text() == '${sessionScope.username}') {
            var deleteCm = "delete" + (i);
            console.log("delete comment id " + deleteCm);
            $("#" + deleteCm).css("visibility", "visible");
        }
    }

    function showRPDelete(i, j) {

        var replyuser = "replyuser" + (i) + "_" + (j);

        if ($("#" + replyuser).text() === '${sessionScope.username}') {
            // console.log("why is this runnin?");
            var deleteRep = "delete" + j;
            $("#" + deleteRep).css("visibility", "visible");

        }
    }

    function showCMReply(i) {
        var cmuser = "cmuser" + i;
        <%--if ($("#" + cmuser).text() === '${sessionScope.username}') {--%>
        var replyCm = "submit" + (i);
        $("#" + replyCm).css("visibility", "visible");
        // }
    }

    function showRPReply(i, j) {

        var replyuser = "replyuser" + (i) + "_" + (j);

        <%--if ($("#" + replyuser).text() === '${sessionScope.username}') {--%>
        var replyRep = "submit" + j;
        $("#" + replyRep).css("visibility", "visible");

        // }
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

        if ('${sessionScope.username}'.length) {
            $('#commentdiv').css("visibility", "visible");
        }

        <%--console.log('${show}');--%>
        var i = 1;
        var j = 100000;

        if ('${show}' === 'true') { //this is good, dont change.

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
            $("#" + "replyuser" + i + "_" + j).text('${reply.userName}');
            $("#" + "RPContent" + j).text('${reply.comment}');
            <%--}--%>
            <%--}--%>
            showRPDelete(i, j);
            showRPReply(i, j);
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

<script type="text/javascript" src="article.js"></script>

<script type="text/javascript" src="../lib/jquery-3.3.1.js"></script>

<%--something for future--%>
<script>
    $(document).ready(function () {

        /*number of post to display*/
        const load_post_count = 3;
        var load_post_next = 0;


        /* Replace the partial content of an post with the full post text */
        function load_full_post() {
            // Retrieve the post id from the element attribute
            var post_id = $(this).attr('post_id');

            // Grab a reference to the paragraph of text that should be replaced
            // This needs to be done here as you cannot use $(this) in the 'success' method of an ajax call
            var post_content = $(this).prev();

            // Disable and hide the 'show full content' button as it is no longer needed
            $(this).off('click');
            $(this).hide();

            $.ajax({
                url: 'https://sporadic.nz/ajax/posts',
                type: 'GET',
                data: {id: post_id},
                success: function (post) {
                    post_content.text(post.content);
                }
            });
        }


        function clear_and_register_post_handlers() {

            $('.post-read-more').off('click');
            $('.post-read-more').click(load_full_post);
        }

        /* Insert a new post into the page. This creates the appropriate elements with classes, attributes
        * and text, then inserts the content into the page */
        function insert_post_into_page(post) {
            // Main post div container
            var post_div = $('<div>');
            post_div.addClass('post');

            // post title line
            var post_title = $('<h5>').text(post.title);
            post_title.addClass('post-title');

            // Author line
            var post_author = $('<h6>');
            post_author.addClass('post-author');
            post_author.attr('author_id', post.author_id); // Store the author id for later use

            /*// post body
            var post_body = $('<p>').text(post.content);
            post_body.addClass('post-body');*/

            // 'Show full content' button
            var post_read_more = $('<div>').text('Show full content');
            post_read_more.addClass('post-read-more');
            post_read_more.addClass('button');
            post_read_more.attr('post_id', post.id); // Store the post id for later use

            // Nest all the elements inside the main post div
            post_div.append(post_title);
            post_div.append(post_author);
            // post_div.append(post_body);
            post_div.append(post_read_more);

            // Need to retrieve the authors name, get this then update the page
            $.ajax({
                url: 'https://sporadic.nz/ajax/users',
                type: 'GET',
                data: {id: post.author_id},
                success: function (user) {
                    // Set the authors name
                    post_author.text(user.first_name + ' ' + user.last_name);

                    // Insert the post at the bottom of the page, above the 'load more posts' button
                    $('#post-load-button').before(post_div);

                    // Ensure that the author name and 'show full content' buttons will work
                    clear_and_register_post_handlers();
                }
            });
        }

        /* Load the next batch of posts into the page */
        function load_more_posts() {
            // Remove the click handler to avoid double click duplicate loads
            $('#post-load-button').off('click');

            $.ajax({
                url: 'https://sporadic.nz/ajax/posts',
                type: 'GET',
                data: {
                    from: load_post_next,
                    count: load_post_count
                },
                success: function (msg) {
                    if (msg.length < load_post_count) {
                        // Disable the button if there are no more posts
                        $('#post-load-button').off('click');
                        $('#post-load-button').css("background-color", "red");
                    }

                    if (msg.length !== 0) {
                        // Grab the id of the last post and mark the next post as the first to be fetched next
                        load_post_next = msg[msg.length - 1].id + 1;

                        // Load each post into the page
                        for (var i = 0; i < msg.length; i++) {
                            insert_post_into_page(msg[i]);
                        }
                    }

                    // Reattach the click handler
                    $('#post-load-button').click(load_more_posts);
                }
            });
        }

        // Register click event on the post load button
        $('#post-load-button').click(load_more_posts);

        // Do an initial load
        load_more_posts();
    });
</script>


<body>


<div class="sticky">
    <%--<header class="c-header">--%>

        <div class="row">
            <nav class="navbar navbar-expand-sm bg-muted">

                <div class="c-header_menu col-lg-12 col-md-12 col-sm-12">

                    <ul class="navbar-nav ">

                        <%--<li><h1 style="color:dimgray; text-align: center;">Your posts</h1></li>--%>

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
    <%--</header>--%>
</div>


<%---------------------------------posts-------------------------------------------------------%>


<div class="container">

    <%----display a full post-------------------%>
    <div class="row mb-5">
        <div class="post1">

            <%--post information start----------------------%>
            <div class="postInfo">

                <%--user icon--%>
                <div class="row">

                    <!--<div class="triangulo"></div>-->`
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
                        <h4 style="font-size: small; color: dimgray">Date: 6/02/2019</h4>
                    </div>
                </div>
            </div>

            <div class="postbody">
                <h2 style="color:dimgray;">${post.title}</h2>

                <div id="postList" class="panel" style="color:dimgray;">
                    <%--load posts here--%>
                    <p style="color: dimgray;">${post.post}.</p>
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
                    </div>

                    <div class="content">
                        <div id="editparent">
                            <div id='editControls' style='text-align:center; padding:5px;'>
                                <div class='btn-group'>
                                    <a class='btn' data-role='undo' href='#'><i class='icon-undo'></i></a>
                                    <a class='btn' data-role='redo' href='#'><i class='icon-repeat'></i></a>
                                </div>
                                <div class='btn-group'>
                                    <a class='btn' data-role='bold' href='#'><b>Bold</b></a>
                                    <a class='btn' data-role='italic' href='#'><em>Italic</em></a>
                                    <a class='btn' data-role='underline' href='#'><u><b>U</b></u></a>
                                    <a class='btn' data-role='strikeThrough' href='#'><strike>abc</strike></a>
                                </div>
                                <div class='btn-group'>
                                    <a class='btn' data-role='justifyLeft' href='#'><i class='icon-align-left'></i></a>
                                    <a class='btn' data-role='justifyCenter' href='#'><i class='icon-align-center'></i></a>
                                    <a class='btn' data-role='justifyRight' href='#'><i
                                            class='icon-align-right'></i></a>
                                    <a class='btn' data-role='justifyFull' href='#'><i
                                            class='icon-align-justify'></i></a>
                                </div>
                                <div class='btn-group'>
                                    <a class='btn' data-role='indent' href='#'><i class='icon-indent-right'></i></a>
                                    <a class='btn' data-role='outdent' href='#'><i class='icon-indent-left'></i></a>
                                </div>
                                <div class='btn-group'>
                                    <a class='btn' data-role='insertUnorderedList' href='#'><i class='icon-list-ul'></i></a>
                                    <a class='btn' data-role='insertOrderedList' href='#'><i
                                            class='icon-list-ol'></i></a>
                                </div>
                                <div class='btn-group'>
                                    <a class='btn' data-role='h1' href='#'>h<sup>1</sup></a>
                                    <a class='btn' data-role='h2' href='#'>h<sup>2</sup></a>
                                    <a class='btn' data-role='p' href='#'>p</a>
                                </div>
                                <div class='btn-group'>
                                    <a class='btn' data-role='subscript' href='#'><i class='icon-subscript'></i></a>
                                    <a class='btn' data-role='superscript' href='#'><i class='icon-superscript'></i></a>
                                </div>
                            </div>


                            <div class="form-group">
                                <div id="post" contenteditable>
                                    <p>Put your post content here...</p>

                             </div>
                    </div>

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
                    </div>

                    <div class="form-group">
                        <label for="post"></label>
                        <textarea class="form-control" rows="20" id="editpost" name="post"
                                  placeholder="Put your post content here..."></textarea>
                    </div>
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
