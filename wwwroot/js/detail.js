function pro1() {
	pro1 = document.querySelectorAll(".img-small-wrap .img-gallery");

	for (var i = 0; i < pro1.length; i++) {
		pro1[i].addEventListener('click', function () {
			value = this.children[0].attributes["src"].value;
			des = document.querySelector(".img-big-wrap img");
			des.src = value;
		});
	}


}
window.onload = function () {
	pro1();
	zeronight();
}
var n = 0;
function increaseNumber() {
	n = n + 1;
	document.getElementById('number').innerHTML = n;
	zeronight();
}
function zeronight() {
	if (document.getElementById("number").innerHTML == 0) {
		document.getElementById("box").style.display = "none";
	}
	else {
		document.getElementById("box").style.display = "block";
	}
}
