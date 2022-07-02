var x= document.getElementById("admin_form");
var y= document.getElementById("descript");
function adminLogin(){
x.style.display ="inline-block";
y.style.display ="none";
}

function cancelLogin(){
	var x= document.getElementById("admin_form");
var y= document.getElementById("descript");
	y.style.display ="inline-block";
   x.style.display ="none";
}
function notLogin(){
    var r = confirm("you not yet Login .Login?");
if (r == true) {
 window.location="login.jsp";
} else {
 window.location="#";
}
}