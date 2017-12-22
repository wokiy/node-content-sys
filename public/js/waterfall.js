$(function () {

	// 瀑布流布局实现
	function waterFall(container,childs,margin) {
		var container = $(container); // 获取容器对象
		var childs = $(container).find('li'); // 获取定位无素
		var containerWidth = container.width(); // 获取容器宽度
		var childsWidth = childs.width(); // 获取定位元素宽度
		var cols = Math.floor(containerWidth / childsWidth); // 计算总列数
		var arr = []; // 定义数组存取每列高度值
		
		childs.each(function () {
			var key = $(this).index(); // 获取元素下标
			var childsHeight = $(this).height(); // 获取元素高度
			if(key < cols) {
				$(this).css({'top':0,'left':(childsWidth + margin) * key}); // 设置元素定位坐标
				arr[key] = childsHeight; // 实时存取每一列高度值
			} else {
				var minCol = arr[0],
					minIndex = 0,
					arrLength = arr.length;
				for(var i=0; i<arrLength; i++) {
					// 计算最小值及下标
					if(arr[i] < minCol) {
						minCol = arr[i];
						minIndex = i;
					}
				}
				$(this).css({'top':minCol + margin,'left':(childsWidth + margin) * minIndex}); // 设置元素定位坐标
				arr[minIndex] += childsHeight + margin;

				// 计算最大值及下标
				maxCol = arr[0];
				for(var j=0; j<arrLength; j++) {
					if(arr[j] > maxCol) {
						maxCol = arr[j];
						maxIndex = j;
					}
				}
			}
		});
		container.find('ul').css('height',maxCol + margin);
	}
	// waterFall('.waterfall','li',35);

	// 鼠标滑过改变显不状态
	function onHover(obj) {
		$(obj).find('li').hover(
			function () {
				//$(this).find('.layer').css({'width':$(this).width() + 20,'height':$(this).height() + 20});
				$(this).css({'border':'1px solid #CCCCCC','background':'#FFFFFF'});
			},
			function () {
				//$(this).find('.layer').css({'width':'','height':''});
				$(this).css({'border':'','background':''});
			}
		);
	}

	onHover('.waterfall');

	// 定位导航
	function fixedNav(obj,scroTop) {
		if('object' != typeof obj) return false;
		$(document).scroll(function () {
			if($(document).scrollTop() >= scroTop) {
				obj.css({'position':'fixed','top':65,'left':205,'z-index':15});
			} else {
				obj.css({'position':'','top':'','left':'','z-index':''});
			}
		});	
	}

	//fixedNav($('.listnav'),70);

});