// 提交后判断用户名和密码是否为空
function validate() {
	var userName = document.getElementById("userName").value;
	var passWord = document.getElementById("passWord").value;
	if (userName == "" || passWord == "") {
		alert("用户名或密码不能为空！");
		return false;
	}
	return true;
}
