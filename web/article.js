//TO DO clear the text content in the modal
//make sure there can be multiple comments that can be replied.

//i and j should continue from the latest values from initilization.

var i = 0;
var j = 100000;      //very unsmart method to distinguish comment and reply

//js for adding comments

function addcomment() {


    var cm = document.getElementById("comment").value;

    var a1 = "<div class='card dark-grey'><img class='card-img-top img-thumbnail rounded-circle boarder-primary' src='images/icons/666201.png' alt='Card image cap' style='width: 50px;height: 50px;'>" +
        "<div class='card-body'><p class='card-title'>Name of Commentor</p><p class='card-text'>";
    var a2 = cm + "</p></div></div></div><br/>" +
        "<button type='submit' class='btn btn-info btn-md float-right' data-toggle='modal' data-target='#replymodal" + j + "'>" +
        "           <strong>Reply Here</strong></button><br/><br/>" +
        " <div class='modal' id='replymodal" + j + "'>" +
        "                    <div class='modal-dialog modal-lg'><div class='modal-content'><div class='modal-body'>" +
        "                                <form action='#'><div class='form-group'><label for='article'></label>" +
        "                                        <textarea class='form-control' rows='5' id='reply" + j + "'" + " placeholder='Reply here...'></textarea></div></form><div class='form-group'>" +
        "                                    <button type='submit' class='btn btn-primary btn-lg' data-dismiss='modal'  onclick='addReply(" + i + "," + j++ + ")'>" +
        "                                        Submit!</button></div></div><div class='modal-footer'><button type='button' class='btn btn-danger' data-dismiss='modal'>Close" +
        "                                </button></div></div></div></div>";

    var a3 = "<ul id='list" + (i++) + "'></ul>";    //make this updated as per i; very
    var div = document.createElement('div');
    div.innerHTML = a1 + a2 + a3;
    document.getElementById("cmList").appendChild(div);
}


//js for adding reply

function addReply(list, replynum) {

    //assign new id to reply.
    var reply;

    reply = document.getElementById("reply" + replynum).value;

    var a1 = "<div class='card dark-grey'>";
    var a2 = "<img class='card-img-top img-thumbnail rounded-circle boarder-primary' src='images/icons/666201.png' alt='Card image cap' style='width: 50px;height: 50px;'>"; //icon image
    var a3 = "<div class='card-body'> ";
    var a4 = "<p class='card-title'>  Name of Commentor</p>";
    var a5 = "<p class='card-text'>";
    var a6 = reply + "</p></div></div></div><br/>" +
        "<button type='submit' class='btn btn-info btn-md float-right' data-toggle='modal' data-target='#replymodal" + j + "' onclick=''>" +
        "           <strong>Reply Here</strong></button><br/><br/>" +
        " <div class='modal' id='replymodal" + j + "'><div class='modal-dialog modal-lg'><div class='modal-content'><div class='modal-body'><form action='#'><div class='form-group'><label for='article'></label>" +
        "                                        <textarea class='form-control' rows='5' id='reply" + j + "'" + " placeholder='Reply here...'></textarea>" +
        "                                    </div></form><div class='form-group'><button type='submit' class='btn btn-primary btn-lg' data-dismiss='modal'  onclick='addReply(" + list + "," + j++ + ")'>" +
        "                                        Submit!</button></div></div><div class='modal-footer'><button type='button' class='btn btn-danger' data-dismiss='modal'>Close" +
        "                                </button></div></div></div></div>";

    var div = document.createElement('div');
    div.innerHTML = a1 + a2 + a3 + a4 + a5 + a6;
    // var id = testlist+i;
    document.getElementById("list" + list).appendChild(div);

}

function deleteComment() {

}