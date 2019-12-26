var url = window.location.pathname;
url = url.split('/');
console.log(url);
var id = url[url.length - 1];
var link = "";

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
		// list 시 게시판 반환 설정
		if (response.category == 1) {
			$("#list3").attr("href", "/itnews/list/1/1/10")
		} else if (response.category == 2) {
			$("#list3").attr("href", "list/1/1/10")
		}else{}

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
							+ '" class="btn btn-danger">' + '삭제' + '</a>'
							+ '</td>' + '</tr>');

		}
	}

});

