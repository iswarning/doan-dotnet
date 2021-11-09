/*Giá Search*/
function myFunction () {
	var x = "50%";
	// var y = parseInt(document.getElementsByClassName('gtco-cover')[0].style.backgroundPositionY) + document.documentElement.scrollTop*0.05;

	// document.getElementsByClassName('gtco-cover')[0].style.backgroundPosition = "50% "+y+"px";						
}

window.onload = function () {

	myFunction();	
	$("#range_01").ionRangeSlider({
		type: "double",
		grid: true,
		min: 1000000,
		max: 100000000,
		from: 1000000,
		to: 50000000,
		prefix: "đ "
	});
	document.getElementById('page1_1').style.display="block";
	document.getElementById('page1_2').style.display="block";
	document.getElementById('page1_3').style.display="block";
	document.getElementById('page1_4').style.display="block";
	document.getElementById('page1_5').style.display="block";
	document.getElementById('page1_6').style.display="block";
	document.getElementById('page1_7').style.display="block";
	document.getElementById('page1_8').style.display="block";
	document.getElementById('page2_1').style.display="none";
	document.getElementById('page2_2').style.display="none";
	document.getElementById('page2_3').style.display="none";
	document.getElementById('page2_4').style.display="none";
	document.getElementById('page2_5').style.display="none";
	document.getElementById('page2_6').style.display="none";
	document.getElementById('page2_7').style.display="none";
	document.getElementById('page2_8').style.display="none";
	document.getElementById('page3_1').style.display="none";
	document.getElementById('page3_2').style.display="none";
	document.getElementById('page3_3').style.display="none";
	document.getElementById('page3_4').style.display="none";
	document.getElementById('Previous').disabled=true;
	document.getElementById('Previous').style.backgroundColor="yellow";
	document.getElementById('Next').disabled=true;
	document.getElementById('Next').style.backgroundColor="yellow";
	document.getElementById('page1').style.backgroundColor="black";
	document.getElementById('page1').style.color="yellow";
	document.getElementById('page2').style.backgroundColor="yellow";
	document.getElementById('page3').style.backgroundColor="yellow";
}

