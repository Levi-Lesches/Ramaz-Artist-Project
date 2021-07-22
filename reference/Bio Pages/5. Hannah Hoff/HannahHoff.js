$(document).ready(function(){

	// Popover
	if ($("#MainPage").hasClass("hidden")) {
		$(function () { 
			$("[data-toggle = 'popover']").popover(); 
		});

		$("html").click(function(e) {
    		$("#Share").popover("hide");
		});

		$("#Share").popover({
		    html: true,
		    content: $("#PopoverContent").html(),
		    trigger: "manual"
		}).click(function(e) {
			$(".popup-marker").on("show", function(event) { 
				$(".popup-marker").filter(function(index, element) { 
					return element != event.target; 
				}).popover("hide"); 
			});
		    $(this).popover("toggle");
		    e.stopPropagation();
		});
	}

	// Menu and Close Buttons
	$("#Menu").click(function() {
		$("#MainPage").removeClass("hidden");
		$("#MenuButton").addClass("hidden");
		$("#CloseButton").removeClass("hidden");
		$("body").addClass("stop-scrolling");
	});

	$("#Close").click(function() {
		$("#MainPage").addClass("hidden");
		$("#CloseButton").addClass("hidden");
		$("#MenuButton").removeClass("hidden");
		$("body").removeClass("stop-scrolling");
	});	

	// Menu Opacity Hover
	$(".gridImage").hover(function(){
		$(this).css("Opacity", "1");
		$(this).find("p").css("color", "black");
	}, function(){
		$(this).css("Opacity", ".5");
		$(this).find("p").css("color", "red");
	});

	// Hamburger Menu
	var $hamburger = $(".hamburger");
  	$hamburger.on("click", function(e) {
    	$hamburger.toggleClass("is-active");
    	$("#NameList").toggleClass("hidden");
    	$("h1").toggleClass("ham");
    	$("body").toggleClass("stop-scrolling");
    	window.scrollTo(0,0);
  	});

  	// Fixes scroll lock on viewport changes
  	$(window).on("resize", function() {
  		if ($(window).width() > 768 && $hamburger.hasClass("is-active")) {
  			$hamburger.removeClass("is-active");
  			$("#NameList").addClass("hidden");
  			$("h1").removeClass("ham");
  			$("body").removeClass("stop-scrolling");
  		} 
  		if ($(window).width() < 768 && !($("MainPage").hasClass("hidden"))) {
  			$("#MainPage").addClass("hidden");
			$("#CloseButton").addClass("hidden");
			$("#MenuButton").removeClass("hidden");
			$("body").removeClass("stop-scrolling");
  		}
  	})

	// Next/Previous video links
		$("#LeftSide").hover(function(){
			$("#LeftText").stop().fadeTo("fast", 1);
			$("#LeftText").animate({left: "+6em"}, {duration: 400, queue: false});
		}, function(){
			$("#LeftText").stop().fadeTo("fast", 0);
			$("#LeftText").animate({left: "-6em"}, {duration: 400, queue: false});
		})
			$("#RightSide").hover(function(){
			$("#RightText").stop().fadeTo("fast", 1);
			$("#RightText").animate({right: "+6em"}, {duration: 400, queue: false});
		}, function(){
			$("#RightText").stop().fadeTo("fast", 0);
			$("#RightText").animate({right: "-6em"}, {duration: 400, queue: false});
		})  			

	// "Disable" the horizontal scroll.
	$(function() {
    	var $body = $(document);
    	$body.bind("scroll", function() {
        	if ($body.scrollLeft() !== 0) {
            	$body.scrollLeft(0);
        	}
    	});
	});

	//Mobile Code
	if (/Mobi/i.test(navigator.userAgent)){
		$("#RightSide, #LeftSide").css("visibility", "hidden");
		var $body = $(document);
    	$body.bind("scroll", function() {
        	// "Disable" the horizontal scroll.
        	if ($body.scrollLeft() !== 0) {
            	$body.scrollLeft(0);
        	}
    	});
    	// Scroll Fade
  		$(window).scroll(function(){
    		$("h1").css("opacity", 1 - $(window).scrollTop() / 50);
  		});
	}

	// Desktop Code
	if (!/Mobi/i.test(navigator.userAgent)) {
		// Scroll Fade
  		$(window).scroll(function(){
    		$("h1").css("opacity", 1 - $(window).scrollTop() / 150);
  		});
	}

});