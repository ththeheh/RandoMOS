//TO DO clear the text content in the modal
//make sure there can be multiple comments that can be replied.


var i = 0;

function addcomment() {
    var cm = document.getElementById("comment").value;

    var a1 = "<div class='card dark-grey'>";
    var a2 = "<img class='card-img-top img-thumbnail rounded-circle boarder-primary' src='../images/icons/666201.png' alt='Card image cap' style='width: 50px;height: 50px;'>"; //icon image
    var a3 = "<div class='card-body'> ";
    var a4 = "<p class='card-title'>  Name of Commentor</p>";
    var a5 = "<p class='card-text'>";
    var a6 = cm + "</p></div></div></div><br/>" +
        "<button type='submit' id=i++ class='btn btn-info btn-md float-right' data-toggle='modal' data-target='#replymodal' onclick=''>" +
        "           <strong>Reply Here</strong></button><br/><br/>" +
        " <div class=\"modal\" id='replymodal'>\n" +
        "                    <div class=\"modal-dialog modal-lg\">\n" +
        "                        <div class=\"modal-content\">\n" +
        "\n" +
        "                            <!-- Modal Header -->\n" +
        "\n" +
        "                            <div class=\"modal-body\">\n" +
        "                                <form action=\"#\">\n" +
        "\n" +
        "                                    <div class=\"form-group\">\n" +
        "                                        <label for=\"article\"></label>\n" +
        "                                        <textarea class=\"form-control\" rows=\"5\" id=\"reply1\"\n" +
        "                                                  placeholder=\"Reply here...\"></textarea>\n" +
        "                                    </div>\n" +
        "                                </form>\n" +
        "                                <div class=\"form-group\">\n" +
        "                                    <button type=\"submit\" class=\"btn btn-primary btn-lg\" data-dismiss=\"modal\"  onclick=\"addReply()\">\n" +
        "                                        Submit!\n" +
        "                                    </button>\n" +
        "                                </div>\n" +
        "                            </div>\n" +
        "\n" +
        "                            <!-- Modal footer -->\n" +
        "                            <div class=\"modal-footer\">\n" +
        "                                <button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Close\n" +
        "                                </button>\n" +
        "                            </div>\n" +
        "\n" +
        "                        </div>\n" +
        "                    </div>\n" +
        "                </div>";
    var id = "list" + (i++);
    var a7 = "<ul id='list'></ul>";
    var div = document.createElement('div');
    div.innerHTML = a1 + a2 + a3 + a4 + a5 + a6 + a7;
    document.getElementById("cmList").appendChild(div);
}

function addReply() {


    var reply = document.getElementById("reply1").value;
    console.log(reply);
    var a1 = "<div class='card dark-grey'>";
    var a2 = "<img class='card-img-top img-thumbnail rounded-circle boarder-primary' src='../images/icons/666201.png' alt='Card image cap' style='width: 50px;height: 50px;'>"; //icon image
    var a3 = "<div class='card-body'> ";
    var a4 = "<p class='card-title'>  Name of Commentor</p>";
    var a5 = "<p class='card-text'>";
    var a6 = reply + "</p></div></div></div><br/>" +
        "<button type='submit' id=i++ class='btn btn-info btn-md float-right' data-toggle='modal' data-target='#replymodal' onclick=''>" +
        "           <strong>Reply Here</strong></button><br/><br/>" +
        " <div class=\"modal\" id='replymodal'>\n" +
        "                    <div class=\"modal-dialog modal-lg\">\n" +
        "                        <div class=\"modal-content\">\n" +
        "\n" +
        "                            <!-- Modal Header -->\n" +
        "\n" +
        "                            <div class=\"modal-body\">\n" +
        "                                <form action=\"#\">\n" +
        "\n" +
        "                                    <div class=\"form-group\">\n" +
        "                                        <label for=\"article\"></label>\n" +
        "                                        <textarea class=\"form-control\" rows=\"5\" id=\"reply2\"\n" +
        "                                                  placeholder=\"Reply here...\"></textarea>\n" +
        "                                    </div>\n" +
        "                                </form>\n" +
        "                                <div class=\"form-group\">\n" +
        "                                    <button type=\"submit\" class=\"btn btn-primary btn-lg\" data-dismiss=\"modal\"  onclick=\"addReply()\">\n" +
        "                                        Submit!\n" +
        "                                    </button>\n" +
        "                                </div>\n" +
        "                            </div>\n" +
        "\n" +
        "                            <!-- Modal footer -->\n" +
        "                            <div class=\"modal-footer\">\n" +
        "                                <button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Close\n" +
        "                                </button>\n" +
        "                            </div>\n" +
        "\n" +
        "                        </div>\n" +
        "                    </div>\n" +
        "                </div>";
    // var a7 = "<ul id=id></ul>";
    var div = document.createElement('div');
    div.innerHTML = a1 + a2 + a3 + a4 + a5 + a6;
    // var id = testlist+i;
    document.getElementById("list").appendChild(div);

}