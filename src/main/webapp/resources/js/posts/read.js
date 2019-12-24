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

$.ajax({
	url : '/comment/' + id,
	type : 'get',
	dataType : "json",
	success : function(response) {
		console.log(response);

		for (var i = 0; i < response.length; i++) {
			$("#comment").append(
					'<tr>' + '<td>' + response[i].id + '</td>' + '<td>'
							+ response[i].writer + '</td>' + '<td>'
							+ response[i].writeDate + '</td>' + '<td>'
							+ response[i].content + '</td>' + '<td>'
							+ '<a href="/comment/delete/' + response[i].id
							+ '">' + '[삭제]' + '</a>' + '</td>' + '</tr>');


		}
		$('#contentPage').html(data).trigger("create");
	}

});
