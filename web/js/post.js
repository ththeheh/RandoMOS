//This is the js file to add comments and replies (nexted comments).



var i = 1;              //comment id.
var j = 1000000;      //reply id to start from large number (there can be better way).

var postI;

function addcomment(postId,show) {


    var cm = document.getElementById("comment").value;
    var a1 = "<div class='card dark-grey' id='commentdiv" + i + "' ><img class='card-img-top img-thumbnail rounded-circle boarder-primary' id='image" + i + "' src='' alt='Card image cap' style='width: 50px;height: 50px;visibility: visible'>" +
        "<div class='card-body'><p class='card-title' id='cmuser" + i + "'></p><p class='card-text' id='CMContent"+i+"'>";
    var a2 = cm + "</p></div><br/><div>" +
        "<button type='submit' id='delete" + i + "' class='btn btn-danger btn-md float-right'  onclick='deleteCM(" + i + ")'  style='visibility:hidden'><strong>Delete</strong></button>" +
        "<button type='submit' id='submit" + i + "' class='btn btn-info btn-md float-right'  style='visibility: hidden' data-toggle='modal' data-target='#replymodal" + j + "'" +
        "<strong>Reply Here</strong></button><br/><br/></div></div>" +
        " <div class='modal' id='replymodal" + j + "'>" +
        " <div class='modal-dialog modal-lg'><div class='modal-content'><div class='modal-body'>" +
        " <form action='addReply'><div class='form-group'><label for='article'></label>" +
        " <textarea class='form-control' rows='5' id='reply" + j + "'" + " placeholder='Reply here...'></textarea></div></form><div class='form-group'>" +
        " <button type='submit' class='btn btn-primary btn-lg' data-dismiss='modal'  onclick='addReply(" + i + "," + j++ + "," + postId + ",false)'>" +
        " Submit!</button></div></div><div class='modal-footer'><button type='button' class='btn btn-danger' data-dismiss='modal'>Close" +
        " </button></div></div></div></div>";


    var a3 = "<ul id='list" + (i++) + "'></ul>";    //make this updated as per i; very
    var div = document.createElement('div');
    div.innerHTML = a1 + a2 + a3;
    document.getElementById("cmList" + postId).appendChild(div);

    if (show === false) {

        //this is the ajax to call servlet to add comment into database
    $.ajax({
        type: 'POST',
        url: 'addComment',
        data: {'postId': postId, 'commentId': (i - 1), 'comment': cm},
        async: true,
        dataType: 'text',
        success: function (userJson) {
            var jsonS = JSON.parse(userJson);
            var cmuser = "cmuser" + (i - 1);
            var imageuser = "image" + (i - 1);
            $("#" + cmuser).text(jsonS["userName"]);
            $("#" + imageuser).attr("src", jsonS["iconPath"]);

            showCMDelete(i-1);
            showCMReply(i-1);

        },
        error: function (xhr, status) {
            alert(xhr.status);
        }
    });
}

//This is to clear the reply modal content everytime it is called.
    $("replymodal"+j).on('shown', function () {
        $("reply"+j).val("")
    })
}

//js for adding replies

    function addReply(cmId, replyId, postId, show) {

        var reply;
        reply = document.getElementById("reply" + replyId).value;

        var a1 = "<div class='card dark-grey'  id='replydiv" + (j-1) + "' style='visibility:visible'>";
        var a2 = "<img id='image" + (j-1) + "' class='card-img-top img-thumbnail rounded-circle boarder-primary' src='' alt='Card image cap' style='width: 50px;height: 50px;'>"; //icon image
        var a3 = "<div class='card-body'> ";
        var a4 = "<p class='card-title' id='replyuser" + (j-1) + "'></p>";
        var a5 = "<p class='card-text' id='RPContent"+(j-1)+"'>";
        var a6 = reply + "</p></div><br/><div>" +
            "<button type='submit' id='delete" + (j-1) + "' class='btn btn-danger btn-md float-right'  onclick='deleteReply("+(j-1)+")' style='visibility: hidden'><strong>Delete</strong></button>" +
            "<button type='submit' id='submit" + (j-1) + "' class='btn btn-info btn-md float-right' style='visibility: hidden' data-toggle='modal' data-target='#replymodal" + (j) + "' " +
            " <strong>Reply Here</strong></button><br/><br/></div></div>" +
            " <div class='modal' id='replymodal" + (j) + "'><div class='modal-dialog modal-lg'><div class='modal-content'><div class='modal-body'><form action='#'><div class='form-group'><label for='article'></label>" +
            " <textarea class='form-control' rows='5' id='reply" + (j) + "'" + " placeholder='Reply here...'></textarea>" +
            " </div></form><div class='form-group'><button type='submit' class='btn btn-primary btn-lg' data-dismiss='modal'  onclick='addReply(" + cmId + "," + (j) + "," + postId +",false)'>" +
            " Submit!</button></div></div><div class='modal-footer'><button type='button' class='btn btn-danger' data-dismiss='modal'>Close" +
            " </button></div></div></div></div>";


        $("replymodal"+(j-1)).on('shown', function () {
            $("reply"+(j-1)).val("")
        });
        j++;
        var div = document.createElement('div');
        div.innerHTML = a1 + a2 + a3 + a4 + a5 + a6;

        document.getElementById("list" + cmId).appendChild(div);


        //this is the ajax to call servlet to add replies into database

        if(show === false) {
            $.ajax({
                type: 'POST',
                url: 'addReply',
                data: {'postId': postId, 'commentId': cmId, 'replyId': (j-2), 'reply': reply},
                async: true,
                dataType: 'text',
                success: function (userJsonStr) {
                    var jsonS = JSON.parse(userJsonStr);
                    var replyuser = "replyuser" + (j-2);
                    var imageuser = "image" + (j-2);
                    $("#" + replyuser).text(jsonS["userName"]);
                    $("#" + imageuser).attr("src", jsonS["iconPath"]);
                    showRPDelete(j-2);
                    showRPReply(j-2);
                },
                error: function (xhr, status) {
                    alert(xhr.status);
                }
            });
        }

    }



