$(document).ajaxStart(function() {

	  $("#svg-back").css("display","block");
	  $("#loading").css("display","block");

	});

	$(document).ajaxStop(function() {
		$("#svg-back").css("display","none");
		$("#loading").css("display","none");
	});