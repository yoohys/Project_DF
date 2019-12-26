var url = window.location.pathname;
url = url.split('/');
var id = url[url.length - 1];
var link = "";

// 게시물 불러오기
$.ajax({
	url : '/question/read/' + id,
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

$.ajax({
	url : '/comment/' + id,
	type : 'get',
	dataType : "json",
	success : function(response) {

		for (var i = 0; i < response.length; i++) {
			$("#comment").append(
					'<tr>' + '<td>' + response[i].id + '</td>' + '<td>'
							+ response[i].writer + '</td>' + '<td>'
							+ response[i].writeDate + '</td>' + '<td colspan=3>'
							+ response[i].content + '</td>' + '<td>'
							+ '<a href="/comment/delete/' + response[i].id
							+ '" class="btn btn-danger">' + '삭제' + '</a>'
							+ '</td>' + '</tr>');

		}
	}

});

