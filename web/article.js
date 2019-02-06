//TO DO clear the text content in the modal
//make sure there can be multiple comments that can be replied.

//i and j should continue from the latest values from initilization.

var i = 1;              //comment id.
var j = 100000;      //very unsmart method to distinguish comment and reply
//js for adding comments
var postI;

function addcomment(postId) {


    console.log(postId);

    var cm = document.getElementById("comment").value;
    var a1 = "<div class='card dark-grey'><img class='card-img-top img-thumbnail rounded-circle boarder-primary' id='image"+i+"' src='' alt='Card image cap' style='width: 50px;height: 50px;'>" +
        "<div class='card-body'><p class='card-title' id='cmuser"+i+"'></p><p class='card-text'>";
    var a2 = cm + "</p></div></div></div><br/>" +
        "<button type='submit' class='btn btn-info btn-md float-right' data-toggle='modal' data-target='#replymodal" + j + "'>" +
        "           <strong>Reply Here</strong></button><br/><br/>" +
        " <div class='modal' id='replymodal" + j + "'>" +
        "                    <div class='modal-dialog modal-lg'><div class='modal-content'><div class='modal-body'>" +
        "                                <form action='addReply'><div class='form-group'><label for='article'></label>" +
        "                                        <textarea class='form-control' rows='5' id='reply" + j + "'" + " placeholder='Reply here...'></textarea></div></form><div class='form-group'>" +
        "                                    <button type='submit' class='btn btn-primary btn-lg' data-dismiss='modal'  onclick='addReply(" + i + "," + j++ +","+ postId + ")'>" +
        "                                        Submit!</button></div></div><div class='modal-footer'><button type='button' class='btn btn-danger' data-dismiss='modal'>Close" +
        "                                </button></div></div></div></div>";

    var a3 = "<ul id='list" + (i++) + "'></ul>";    //make this updated as per i; very
    var div = document.createElement('div');
    div.innerHTML = a1 + a2 + a3;
    console.log("cmList" + postId + "this is i" + i);
    document.getElementById("cmList" + postId).appendChild(div);

    $.ajax({
        type: 'POST',
        url: 'addComment',
        data: {'postId': postId, 'commentId': (i - 1), 'comment': cm},
        async: true,
        dataType:'text',
        success: function (userJson) {
            // console.log(userJson);
            var jsonS = JSON.parse(userJson);
            var cmuser = "cmuser" + (i - 1);
            var imageuser = "image" + (i - 1);
            // console.log(cmuser);
            // console.log(imageuser);
            $("#"+cmuser).text(jsonS["userName"]);
            $("#"+imageuser).attr("src",jsonS["iconPath"]);
            alert("Your comment is published!");
        },
        error: function(xhr, status) {
            alert(xhr.status);}
    });


}


//js for adding reply

function addReply(list,replyId,postId) {

    //assign new id to reply.
    var reply;
    reply = document.getElementById("reply" + replyId).value;

    var a1 = "<div class='card dark-grey'>";
    var a2 = "<img id='image" + (j - 1)+"' class='card-img-top img-thumbnail rounded-circle boarder-primary' src='' alt='Card image cap' style='width: 50px;height: 50px;'>"; //icon image
    var a3 = "<div class='card-body'> ";
    var a4 = "<p class='card-title' id='replyuser"+(i-1)+"_"+(j-1)+"'></p>";
    var a5 = "<p class='card-text'>";
    var a6 = reply + "</p></div></div></div><br/>" +
        "<button type='submit' class='btn btn-info btn-md float-right' data-toggle='modal' data-target='#replymodal" + j + "' onclick=''>" +
        "           <strong>Reply Here</strong></button><br/><br/>" +
        " <div class='modal' id='replymodal" + j + "'><div class='modal-dialog modal-lg'><div class='modal-content'><div class='modal-body'><form action='#'><div class='form-group'><label for='article'></label>" +
        "                                        <textarea class='form-control' rows='5' id='reply" + j + "'" + " placeholder='Reply here...'></textarea>" +
        "                                    </div></form><div class='form-group'><button type='submit' class='btn btn-primary btn-lg' data-dismiss='modal'  onclick='addReply(" + (i-1) + "," + j++ +","+postId+")'>" +
        "                                        Submit!</button></div></div><div class='modal-footer'><button type='button' class='btn btn-danger' data-dismiss='modal'>Close" +
        "                                </button></div></div></div></div>";

    var div = document.createElement('div');
    div.innerHTML = a1 + a2 + a3 + a4 + a5 + a6;
    // var id = testlist+i;

    console.log("list"+list);

    document.getElementById("list" + list).appendChild(div);

    console.log("this is the postId"+postId);
    //
    $.ajax({
        type: 'POST',
        url: 'addReply',
        data: {'postId': postId, 'commentId': (i - 1), 'replyId': (j-2),'reply':reply},
        async: true,
        dataType:'text',
        success: function (userJsonStr) {
            // console.log(userJson);
            var jsonS = JSON.parse(userJsonStr);
            var replyuser = "replyuser" + (i-1)+"_"+(j-2);
            var imageuser = "image" + (j - 2);
            // console.log(cmuser);
            // console.log(imageuser);
            $("#"+replyuser).text(jsonS["userName"]);

            $("#"+imageuser).attr("src",jsonS["iconPath"]);
            alert("Your reply is published!");
        },
        error: function(xhr, status) {
            alert(xhr.status);}
    });

}




