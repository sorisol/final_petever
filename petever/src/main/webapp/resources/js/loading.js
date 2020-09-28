$(document).ajaxStart(function() {

	  $("#svg-back").css("display","block");
	  $("svg").css("display","block");

	});

	$(document).ajaxStop(function() {
		$("#svg-back").css("display","none");
		$("svg").css("display","none");
	});