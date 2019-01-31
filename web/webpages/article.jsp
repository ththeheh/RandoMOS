<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Article</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>

    <script type="text/javascript" src="article.js"></script>

</head>
<body>

<!--should be normal nav bars-->

<div class="jumbotron text-center bg-muted" style="margin-bottom:0">
    <h1 style="color:dimgray;">My article page UOAMOS </h1>
</div>
<header class="c-header" style="margin-top:5px; margin-bottom:10px">
    <nav class="navbar navbar-expand-sm bg-muted">
        <div class="container">

            <div class="c-header_menu" col-lg-4 col-md- col-sm-1>
                <ul class="navbar-nav">
                    <li class="nav-item ">
                        <a class="nav-link text-muted" href="#"> Home </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted" href="#">Forum</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-muted" href="#" id="navbarDropDown" role="button"
                           data-toggle="dropdown"> Hot </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Hot</a>
                            <a class="dropdown-item" href="#">New</a>
                            <a class="dropdown-item" href="#">Controversial</a>
                            <a class="dropdown-item" href="#">Top</a>
                            <a class="dropdown-item" href="#">Rising</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-muted" href="#" id="navbarDropDown" role="button"
                           data-toggle="dropdown"> Theme </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">School</a>
                            <a class="dropdown-item" href="#">Social</a>
                            <a class="dropdown-item" href="#">New</a>
                            <a class="dropdown-item" href="#">Top</a>
                            <a class="dropdown-item" href="#">Rising</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted" href="#"> FAQs </a>
                    </li>
                </ul>
            </div>
            <div class="c-header_user" col-lg-4 col-md- col-sm-1>
                <div>
                    <form action="/UserData" method="post">
                        <input type="text"
                               style="-moz-border-radius:5px; -webkit-border-radius: 5px; padding-right:1px; padding-left:3px; aborder-radius: 6px;"
                               name="Code" placeholder="Search">
                    </form>
                </div>
                <div>
                    <c:choose>
                        <c:when test="${username !=null}">
                            <a class="nav-link text-muted" href="#"> Logout </a>
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link text-muted" href="#"> Login </a>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div>
                    <c:choose>
                        <c:when test="${username ==null}">
                            <a class="nav-link text-muted" href="reg.html"> Register </a>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div>
                    <c:choose>
                        <c:when test="${username !=null}">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                Create New Articles!
                            </button>
                            <div class="modal" id="myModal">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">You can write your article here!
                                            </h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>

                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <form action="#">
                                                <%--send to servlet and build the article using this page.--%>
                                                <div class="form-group">
                                                    <label for="title"><strong> Your Title:</strong></label>
                                                    <input type="text" class="form-control" id="title" required>
                                                </div>

                                                <div class="form-group">
                                                    <label for="article"></label>
                                                    <textarea class="form-control" rows="20" id="article"
                                                              placeholder="Put your article content here..."></textarea>
                                                </div>
                                            </form>
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-primary btn-lg" onclick="">
                                                    Publish!
                                                </button>
                                            </div>
                                        </div>

                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close
                                            </button>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <%--<a class="nav-link text-muted" href="createarticle.html"><h5> Create New Articles! </h5></a>--%>

                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>
</header>
<!---->

<div class="container">
    <div class="row">
        <div class="header">
            <!--<div class="triangulo"></div>-->
            <div class="profile">
                <!--to add the profile imgs -->
                <img class='card-img-top img-thumbnail rounded-circle boarder-primary' src='../images/icons/666201.png'
                     alt='Card image cap' style='width: 150px;height: 150px;'>
                <span class="name-author"></span>
            </div>
            <h2 class="title"></h2>
        </div>

        <!-- INFO -->
        <div class="row">
            <div class="col-xs-12 mx-5 ">
                <h2 style="line-height: 25px;">Article Name:This is text genered from Lorem ipsum.</h2>
                <br/>
                <h4 style="line-height: 25px;">Date: 30/01/2019</h4>
            </div>
        </div>
        <div class="row row-eq-height m-auto">
            <div class="col-lg-8 text m-auto">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                    et dolore magna aliqua. Lectus magna fringilla urna porttitor. Maecenas sed enim ut sem viverra
                    aliquet eget. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Id
                    consectetur purus ut faucibus pulvinar elementum integer enim neque. Nunc eget lorem dolor sed
                    viverra ipsum nunc aliquet. Tempor orci eu lobortis elementum. Egestas dui id ornare arcu odio.
                    Pretium fusce id velit ut tortor pretium viverra suspendisse. Sed vulputate odio ut enim. Semper
                    eget duis at tellus. Vestibulum lorem sed risus ultricies. Adipiscing enim eu turpis egestas
                    pretium. Orci porta non pulvinar neque laoreet. Eu sem integer vitae justo eget magna fermentum
                    iaculis eu. Tellus molestie nunc non blandit massa enim nec dui. Volutpat ac tincidunt vitae semper
                    quis lectus. Lobortis scelerisque fermentum dui faucibus. Integer malesuada nunc vel risus commodo
                    viverra maecenas. Rutrum quisque non tellus orci ac auctor augue mauris augue.

                    Rhoncus dolor purus non enim. Sed egestas egestas fringilla phasellus faucibus. Egestas tellus
                    rutrum tellus pellentesque eu tincidunt tortor aliquam. Amet mauris commodo quis imperdiet massa
                    tincidunt nunc. Quis blandit turpis cursus in hac habitasse platea. Turpis tincidunt id aliquet
                    risus feugiat in ante metus. Nisl vel pretium lectus quam id. Curabitur gravida arcu ac tortor
                    dignissim convallis aenean et. Porttitor leo a diam sollicitudin tempor id eu. A cras semper auctor
                    neque vitae tempus quam pellentesque. Tristique risus nec feugiat in fermentum posuere urna. Ac
                    tincidunt vitae semper quis lectus nulla. Id eu nisl nunc mi ipsum. Amet consectetur adipiscing elit
                    duis tristique. Ullamcorper eget nulla facilisi etiam.

                    Posuere morbi leo urna molestie at elementum eu facilisis. Cras tincidunt lobortis feugiat vivamus
                    at augue eget arcu. Morbi tristique senectus et netus et malesuada fames ac turpis. Cursus metus
                    aliquam eleifend mi in. Nunc scelerisque viverra mauris in aliquam sem. Eget mi proin sed libero
                    enim sed faucibus turpis. Lorem dolor sed viverra ipsum nunc. Vel pharetra vel turpis nunc eget
                    lorem dolor. Ullamcorper morbi tincidunt ornare massa eget egestas purus viverra accumsan. Amet
                    risus nullam eget felis eget nunc lobortis mattis. Hac habitasse platea dictumst quisque sagittis.
                    Justo nec ultrices dui sapien eget mi proin sed libero. Rhoncus est pellentesque elit ullamcorper
                    dignissim cras tincidunt. Sed risus pretium quam vulputate dignissim suspendisse in. Elementum
                    sagittis vitae et leo duis ut. Viverra ipsum nunc aliquet bibendum enim facilisis. Massa enim nec
                    dui nunc.

                    Diam vel quam elementum pulvinar etiam non. Euismod quis viverra nibh cras pulvinar mattis nunc sed
                    blandit. Quis enim lobortis scelerisque fermentum dui faucibus. Arcu dictum varius duis at
                    consectetur lorem. Nulla pellentesque dignissim enim sit amet venenatis urna cursus. Nunc id cursus
                    metus aliquam eleifend mi. Lacus suspendisse faucibus interdum posuere lorem. Felis donec et odio
                    pellentesque diam volutpat commodo sed egestas. Adipiscing tristique risus nec feugiat. Egestas sed
                    tempus urna et pharetra pharetra massa massa. Donec ac odio tempor orci dapibus ultrices.

                    Aenean sed adipiscing diam donec adipiscing tristique risus nec. Amet mauris commodo quis imperdiet
                    massa tincidunt nunc pulvinar sapien. Neque gravida in fermentum et sollicitudin. Dapibus ultrices
                    in iaculis nunc sed augue lacus viverra vitae. Massa enim nec dui nunc mattis enim ut tellus
                    elementum. Elementum facilisis leo vel fringilla est ullamcorper. Auctor eu augue ut lectus arcu.
                    Pellentesque elit eget gravida cum sociis natoque penatibus et magnis. Est placerat in egestas erat
                    imperdiet sed euismod nisi porta. In hac habitasse platea dictumst quisque. Sed sed risus pretium
                    quam vulputate. Ut lectus arcu bibendum at varius. Condimentum vitae sapien pellentesque habitant
                    morbi tristique senectus et. Vitae sapien pellentesque habitant morbi. Aliquam eleifend mi in nulla
                    posuere. At elementum eu facilisis sed odio. </p>
            </div>

        </div>
    </div>
</div>

<br/>
<br/>

<div class="row">
    <div class="col-lg-8 col-sm-8 col-md-8 m-auto">
        <div class="form-group">
            <label for="comment">Your Comment:</label>
            <textarea class="form-control" rows="5" id="comment"></textarea>
        </div>
        <button type="submit" class="btn btn-info btn-lg float-right" onclick="addcomment()"><strong>Comment</strong>
        </button>
    </div>
</div>
<br/>
<br/>
<br/>

<div class="row">
    <ul id="cmList" class="col-lg-8 m-auto">

    </ul>
</div>

<div class="jumbotron bg-dark jumbotron-fluid">
    <img class="img-responsive mx-auto d-block" src="" width="600">
</div>
</body>
</html>