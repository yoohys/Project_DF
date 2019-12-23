var url = window.location.pathname;
url = url.split('/');
console.log(url);
var id = url[url.length - 1];

// 게시물 불러오기
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

//$.ajax({
//	url : '/post/read/id',
//	type : 'get',
//	dataType : "json",
//	success : function(response) {
//		console.log(response);
//
//		for (var i = 0; i < response.length; i++) {
//	$("table").append(
//			'<tr>' + '<td>' + response[i].id + '</td>'
//					+ '<td id="title">' + '<a href=/post/read/'
//					+ response[i].id + '>' + response[i].title + '</a>'
//					+ '</td>' + '<td>' + response[i].writer + '</td>'
//					+ '<td>' + response[i].writeDate + '</td>' + '<td>'
//					+ '<td id="title">' + '<a href="/post/read/">'
//					+ response[i].title + '</a>' + '</td>' + '<td>'
//					+ response[i].writer + '</td>' + '<td>'
//					+ response[i].writeDate + '</td>' + '<td>'
//					+ '</td>' + '</tr>');
//	});
