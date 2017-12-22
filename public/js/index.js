$(function () {
	/* 设置或取消图片背景边框 */
	$('.thumb li').mouseover(function () {
		$(this).find('.cover').css({'border':'1px solid #CCCCCC','display':'block'});
		$(this).find('p a').css({'color':'orange'});
	});
	$('.thumb li').mouseout(function () {
		$(this).find('.cover').css({'border':'none','display':'none'});
		$(this).find('p a').css({'color':''});
	});
	
	/* 焦点图 */
	var _left = 710;
	var left = -_left;
	function mainShow() {
		if(left == -6390 || left == 0) {
			_left = -_left;
		}
		$('.wrap').stop().animate({'left':left},1000);
		left = left - _left;
		timer = setTimeout(mainShow,5000);
	}
	mainShow();

	// 鼠标滑过图片停止
	$('div.v').hover(
		function() {
			clearTimeout(timer);
			$('.thumbpics').fadeIn();
		},
		function() {
			$('.thumbpics').fadeOut();
			timer = setTimeout(mainShow,5000);
		}
	);
	// 鼠标滑过缩略图切换图片
	$('.thumbpics li').mouseover(function () {
		var key = $(this).parent().find('li').index(this);
		left = key * -710;
		clearTimeout(timer);
		$('.wrap').stop().animate({'left':left},1000);
		if(left == -6390) {
			left = -6390 + 710;
		}
		if(left == 0) {
			left = -710;
		}
		$(this).parent().find('li').css('background','none');
		$(this).parent().find('li').get(key).style.background = 'orange';
	});

	/* 滚动效果 */
	var rollObj = document.getElementsByClassName('wbdesc')[0];
	removeWhitespace(rollObj);
	var firstChild = rollObj.firstChild;
	var firstChildHeight = firstChild.offsetHeight;

	rollObj.style.top = - firstChildHeight - 10 + 'px';
	var h = parseInt(rollObj.style.top);
	var n = h;
	function autoRoll() {
		n = n + Math.abs(h / 100);
		if(n <= 0) {
			rollObj.style.top = n + 'px';
			window.setTimeout(arguments.callee,30);
		} else {
			firstChild = rollObj.lastChild.cloneNode(true);
			rollObj.removeChild(rollObj.lastChild);
			rollObj.insertBefore(firstChild,rollObj.firstChild);
			firstChildHeight = firstChild.offsetHeight;
			rollObj.style.top = - firstChildHeight - 10 + 'px';
			h = parseInt(rollObj.style.top);
			n = h;
			window.setTimeout(arguments.callee,3000);
		}

	}

	autoRoll();

	/* 微信二维码 */
	$('.weixin').hover(
		function () {
			$('.wximg').fadeIn(300);
		},
		function () {
			return false;
		}
	);
	$('.wximg').hover(
		function () {
			return false;
		},
		function () {
			$('.wximg').fadeOut(300);
		}
	);

});