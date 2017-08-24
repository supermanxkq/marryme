$(function() {
	$(".focus").click(function() {
		var id = $(this).data("id");
		$.ajax({
			url : "FocusOnServlet",
			data : {
				id : id
			},
			type : 'post',
			success : function(data) {
				alert("关注成功！");
				window.location.href = "IndexServlet";
			}

		})

	})
	$(".cancelfocus").click(function() {
		var id = $(this).data("id");
		var uid = $(this).data("uid");
		
		$.ajax({
			url : "FocusCancelServlet",
			data : {
				id : id
			},
			type : 'post',
			success : function(data) {
				alert("取消关注成功！");
				window.location.href = "FocusServlet?id="+uid;
			}

		})

	})

})
