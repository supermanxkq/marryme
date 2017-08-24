
function validateRegeditInfo() {
	var userName = document.getElementById("userName").value;
	var passWord = document.getElementById("passWord").value;
	var confirmPwd = document.getElementById("confirmPwd").value;
	var validateCode = document.getElementById("validateCode").value;
	if (userName == "" || passWord == "" || confirmPwd == ""
			|| validateCode == "") {
		alert("不能为空！");
		return false;
	}
	return true;
}


function validatePwd(){
	var pwd1=document.getElementById("passWord").value;
	var pwd2=document.getElementById("confirmPwd").value;
	if(pwd1!=pwd2){
		$(".tip").html("两次输入的密码不相同！");
	}
}