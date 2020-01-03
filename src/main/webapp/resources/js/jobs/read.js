var url = window.location.pathname;
url = url.split('/');
var id = url[url.length - 1];
var link = "";

// 질문 불러오기
$.ajax({
	url : '/jobs/read/' + id,
	type : 'get',
	dataType : "json",
	success : function(response) {
		$("#title").val(response.title);
		$("#id").val(response.id);
		$("#id2").val(response.id);
		$("#writer").val(response.writer);
		$("#content").append(response.content);
		$("#modifyDate").val(response.modifyDate);

	},
	fail : function(error) {
		alert('???');
	},
	always : function(response) {
		console.log("call always()");
	}
});

