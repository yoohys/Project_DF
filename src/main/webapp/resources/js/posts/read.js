var url = window.location.pathname;
url = url.split('/');
var id = url[url.length - 1];
var link = "";

// 게시물 불러오기
$.ajax({
	url : '/post/read/' + id,
	type : 'get',
	dataType : "json",
	success : function(response) {
		$("#title").val(response.title);
		$("#id").val(response.id);
		$("#id2").val(response.id);
		$("#writer").val(response.writer);
		$("#content").append(response.content);
		$("#modifyDate").val(response.modifyDate);
		// list 시 게시판 반환 설정
		if (response.category == 1) {
			$("#list3").attr("href", "/itnews/list/1/1/10")
		} else if (response.category == 2) {
			$("#list3").attr("href", "list/2/1/10")
		} else {
		}

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

// 댓글 작성 js

function check() {
	var con = $('input[name="comment_content"]').val();

	if (con == '') {
		alert("댓글 내용이 비어있습니다.");
		return true;
	}

	return false;
}
$('button[type="submit"]').on("click", function(e) {
	e.preventDefault();

	if (!check()) {
		comment_write();
	}
});
function comment_write() {
	
	$('form').attr('action', '/comment/write').attr('method', 'post').submit();
	alert("댓글이 등록되었습니다.");

}
