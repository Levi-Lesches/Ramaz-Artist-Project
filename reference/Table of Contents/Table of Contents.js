$(document).ready(function(){

	// fades in names
	$("#Li1, #Li2, #Li3, #Li4, #Li5, #Li6, #Li7, #Li8, #Li9, #Li10, #Li11, #Li12").css("opacity", "0");

	$("#Li1").stop().fadeTo(150, 1, function(){
		$("#Li2").stop().fadeTo(150, 1, function(){
			$("#Li3").stop().fadeTo(50, 1, function(){
				$("#Li4").stop().fadeTo(150, 1, function(){
					$("#Li5").stop().fadeTo(150, 1, function(){
						$("#Li6").stop().fadeTo(150, 1, function(){
							$("#Li7").stop().fadeTo(150, 1, function(){
								$("#Li8").stop().fadeTo(150, 1, function(){
									$("#Li9").stop().fadeTo(150, 1, function(){
										$("#Li10").stop().fadeTo(150, 1, function(){
											$("#Li11").stop().fadeTo(150, 1, function(){
												$("#Li12").stop().fadeTo(150, 1);
											});
										});
									});
								});
							});
						});
					});
				});
			});
		});
	});

	// Mobile Code
	if (/Mobi/i.test(navigator.userAgent)){
		$("#RightSide, #LeftSide").css("visibility", "hidden");
		var $body = $(document);
    	$body.bind("scroll", function() {
        	// "Disable" the horizontal scroll.
        	if ($body.scrollLeft() !== 0) {
            	$body.scrollLeft(0);
        	}
    	});
	}

	// Desktop Code
	if (!/Mobi/i.test(navigator.userAgent)) {

		// Clears lists and makes image appear on hover
    	$("span.c1").hover(function(){
			$("span.c2").css("visibility", "hidden");
			$("figure").addClass("picRight")
				.css("opacity", 0)
				.removeClass("hidden")
				.stop().fadeTo(750, 1);
		}, function(){
			$("span.c2").css("visibility", "visible");
			$("figure").removeClass("picRight")
				.addClass("hidden");
		});

		$("span.c2").hover(function(){
			$("span.c1").css("visibility", "hidden");
			$("figure").addClass("picLeft")
				.css("opacity", 0)
				.removeClass("hidden")
				.stop().fadeTo(750, 1);
		}, function(){
			$("span.c1").css("visibility", "visible");
			$("figure").removeClass("picLeft")
				.addClass("hidden");
		})

		// Changes picture and caption
		$("#Li1").mouseenter(function(){
			$("img.pic").attr("src", "GabrielleAmar.jpg");
			$("figcaption").html("on Francis Bacon's <i>Head I</i>");	
		})

		$("#Li2").mouseenter(function(){
			$("img.pic").attr("src", "DanielleBendavid.jpg");
			$("figcaption").html("on Claude Monet's <i>Water Lilies</i>");
		})

		$("#Li3").mouseenter(function(){
			$("img.pic").attr("src", "SimoneFinkelstein.jpg");
			$("figcaption").html("on The Hôtel de Varengeville Room");
		})

		$("#Li4").mouseenter(function(){
			$("img.pic").attr("src", "ArielleHadad.jpg");
			$("figcaption").html("on Jan van Eyck's <i>The Last Judgment</i>");
		})

		$("#Li5").mouseenter(function(){
			$("img.pic").attr("src", "HannahHoff.jpg");
			$("figcaption").html("on Edgar Degas' <i>The Little Fourteen Year-Old Dancer</i>");
		})

		$("#Li6").mouseenter(function(){
			$("img.pic").attr("src", "MariahHubert.jpg");
			$("figcaption").html("on Édouard Vuillard's <i>The Album</i>");
		})

		$("#Li7").mouseenter(function(){
			$("img.pic").attr("src", "MoselleKleiner.jpg");
			$("figcaption").html("on <i>Marble head of a veiled woman</i>");
		})

		$("#Li8").mouseenter(function(){
			$("img.pic").attr("src", "IlanKogan.jpg");
			$("figcaption").html("on <i>The Temple of Dendur</i>");
		})

		$("#Li9").mouseenter(function(){
			$("img.pic").attr("src", "LaurenRosen.jpg");
			$("figcaption").html("on Gino Severini's <i>Dancer = Propeller = Sea</i> & Sol Lewitt's <i>Wall Drawing 370</i>");
		})

		$("#Li10").mouseenter(function(){
			$("img.pic").attr("src", "SabrinaSchochet.jpg");
			$("figcaption").html("on Francis Bacon's <i>Three Studies for a Self-Portrait</i>");
		})

		$("#Li11").mouseenter(function(){
			$("img.pic").attr("src", "OliviaSchwartz.jpg");
			$("figcaption").html("on Jules Bastien-Lepage's <i>Joan of Arc<i>");
		})

		$("#Li12").mouseenter(function(){
			$("img.pic").attr("src", "LilyShams.jpg");
			$("figcaption").html("on Winslow Homer and J.M.W Turner");
		})

		// Next/Previous video links
		$("#LeftSide").hover(function(){
			$("#LeftText").stop().fadeTo("fast", 1);
			$("#LeftText").animate({left: "+=4em"}, {duration: 400, queue: false});
		}, function(){
			$("#LeftText").stop().fadeTo("fast", 0);
			$("#LeftText").animate({left: "-=4em"}, {duration: 400, queue: false});
		})

		$("#RightSide").hover(function(){
			$("#RightText").stop().fadeTo("fast", 1);
			$("#RightText").animate({right: "+=4em"}, {duration: 400, queue: false});
		}, function(){
			$("#RightText").stop().fadeTo("fast", 0);
			$("#RightText").animate({right: "-=4em"}, {duration: 400, queue: false});
		})
	}
})




