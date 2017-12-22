// 清除空白节点
function removeWhitespace(xml) {
	var loopIndex;

	for (loopIndex = 0; loopIndex < xml.childNodes.length; loopIndex++){
		var currentNode = xml.childNodes[loopIndex];
		if (currentNode.nodeType == 1){
			removeWhitespace(currentNode);
		}

		if (((/^\s+$/.test(currentNode.nodeValue))) && (currentNode.nodeType == 3)){
			xml.removeChild(xml.childNodes[loopIndex--]);
		}
	}
}

// 固定定位元素
function autoFixed(obj,scroTop,fixedStyle) {
	if('object' != typeof obj) return false;
	$(document).scroll(function () {
		if($(document).scrollTop() >= scroTop) {
			obj.addClass('fixed ' + fixedStyle);
		} else {
			obj.removeClass('fixed ' + fixedStyle);
		}
	});
}

// 取消定位
//function resetFixed(obj,fixedStyle) {
//	if('object' != typeof obj) return false;
//	$(document).scroll(function () {
//		//alert($(window).height())
//		if($(document).height() - $(document).scrollTop() - $(window).height() -90 < 0) {
//			obj.removeClass('fixed ' + fixedStyle);
//		}
//	});
//}
