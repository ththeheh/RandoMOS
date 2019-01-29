var i = 0;

function addcomment() {
    var cm = document.getElementById("comment").value;
    console.log(cm);
    var a1 = "<div class='card dark-grey'>";
    var a2 = "<img class='card-img-top img-thumbnail rounded-circle boarder-primary' src='./images/icons/666201.png' alt='Card image cap' style='width: 50px;height: 50px;'>" //icon image
    var a3 = "<div class='card-body'> ";
    var a4 = "<p class='card-title'>  Name of Commentor</p>"
    var a5 = "<p class='card-text'>";
    var a6 = cm + "</p></div></div></div><br/><button type='submit' class=\"btn btn-info btn-sm float-right\" onclick=''><strong>Reply</strong></button><br/><br/>";

    var div = document.createElement('div');
    div.innerHTML = a1+a2+a3+a4+a5+a6;
    document.getElementById("cmList").appendChild(div);

}