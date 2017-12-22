$(function () {
	// 固定定位显示导航
	autoFixed($('.nav'),35,'navfixed');
	autoFixed($('#line'),35,'linefixed');
	autoFixed($('.fixedwrap'),166,'siderfixed');
	autoFixed($('.sharewrap'),166,'sharefixed');

	// 定位返回顶部 意见反馈
	function fixedTools() {
		$(window).scroll(function () {
			if($(document).height() - $(document).scrollTop() - $(window).height() <= 25) {
				$('.tools').stop().animate({'bottom':80},50);
			} else {
				$('.tools').stop().animate({'bottom':10},50);
			}
		});
	}
	fixedTools();
	// 显示、隐藏 返回顶部
	function gotopHover() {
		$(document).scroll(function () {
			//alert($(document).scrollTop())
			if($(document).scrollTop() >= 100) {
				$('.tools .gotop').stop().css('display','block');
			} else {
				$('.tools .gotop').stop().css('display','none');
			}
		});		
	}
	gotopHover();

	// 返回顶部功能实现
	$('.gotop').click(function () {
		var top = $(document).scrollTop();
		(function () {
			var timer = setInterval(function () {
				if(top > 0) {
					top = top - 100;
					$(document).scrollTop(top);
				} else {
					clearInterval(timer);
				}
			},30);
		})();
	});

	// 显示、隐藏意见反馈表单
	$('.suggest').click(function () {
		$('.sugform').animate({'height':205},500);
	});
	$('.close').click(function () {
		$('.sugform').animate({'height':0},500);
	});

});
