var i = 0;

function addcomment() {
    var a1 = "<div class='row'><div class='col-lg-8 card dark-grey'><div class='container center'><p>video</p><img src= ";
    var a = "";            //icon image
    var a2 = " alt=sir pic style=width:80%><p>John Doe</p></div></div></div></div>";
    var div = document.createElement('div');
    div.innerHTML = a1+a+a2;
    document.getElementById("cmList").appendChild(div);

}