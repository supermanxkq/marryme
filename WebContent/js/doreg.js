function checkUser(ouser) {
	var uname = ouser.value;
	//alert(uname);
	if (!uname) {
		return;
	}
	// 创建get请求的字符串
	var url = "DoReg?userName="+ uname;
	// 创建一个XMLHttpRequest对象
	xmlHttpRequest = createXmlHttpRequest();
	// 设置回调函数
	xmlHttpRequest.onreadystatechange = haoLeJiaoWo;
	// 初始 xmlHttpRequest
	xmlHttpRequest.open("get", url, true);
	// 发送请求
	xmlHttpRequest.send(null);

}
function haoLeJiaoWo() {
	// 返回请求的当前状态（接收数据完毕4，并且正确返回）
	if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
		// &&xmlHttpRequest.readystate==4????????????????????????????????????
		// 声明一个变量，用来将返回信息作为文本字符串

		var result = xmlHttpRequest.responseText;
		// 空格去除
		result = result.replace(/(^\s*)|(\s*$)/g, "");
		if (result == "true") {
			$(".tip").html("用户名已经存在！请输入其他用户名！");
			document.getElementById("zhuce").disabled = true;
		} else {
			document.getElementById("zhuce").disabled = false;
		}
	}
}
// 创建XMLHttpRequest的方法
function createXmlHttpRequest() {
	if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else {
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
}