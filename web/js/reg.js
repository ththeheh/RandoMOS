'use strict';

//Just to alert when confirmation password does not match the password.

var password = document.getElementById("password")
    , confirm_password = document.getElementById("cpass");

function cpassword() {

    var password = document.getElementById("password")
        , confirm_password = document.getElementById("cpass");

    if (password.value !== confirm_password.value) {
        alert("Your confirmation password does not match your password!");
        redirect("reg.html");
    } else {
        redirect("login.html")
    }
}



