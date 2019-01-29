'use strict';

var password = document.getElementById("password")
    , confirm_password = document.getElementById("cpass");

function cpassword() {

    var password = document.getElementById("password")
        , confirm_password = document.getElementById("cpass");

    if (password.value !== confirm_password.value) {
        alert("Your confirmation password does not match your password!");
        redirect("reg.html");
    } else {
    }
}


function countrylist(){
    var myDiv = document.getElementById("countrylist");

//Create array of options to be added
    var array = ["Volvo","Saab","Mercades","Audi"];

//Create and append select list
    var selectList = document.createElement("select");
    selectList.setAttribute("id", "mySelect");
    myDiv.appendChild(selectList);

//Create and append the options
    for (var i = 0; i < array.length; i++) {
        var option = document.createElement("option");
        option.setAttribute("value", array[i]);
        option.text = array[i];
        selectList.appendChild(option);
    }
}

