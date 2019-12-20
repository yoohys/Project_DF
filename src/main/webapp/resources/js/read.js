var url = window.location.pathname;
url = url.split('/');
console.log(url);
var id = url[url.length - 1];

$.ajax({
	url : '/post/read/' + id,
	type : 'get',
	dataType : "json",
	success : function(response) {
		console.log(response);
		$("#title").val(response.title);
		$("#id").val(response.id);
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
// 암호 확인
