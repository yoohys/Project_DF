var url = window.location.pathname;
url = url.split('/');
var id = url[url.length - 1];
var link = "";

// 질문 불러오기
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
// 답글 불러오기
$.ajax({
	url : '/answer/' + id,
	type : 'get',
	dataType : "json",
	success : function(response) {

		for (var i = 0; i < response.length; i++) {
			$("#answer").append(
					'<tr>' + '<td>' + response[i].id + '</td>' + '<td>'
							+ response[i].writer + '</td>' + '<td>'
							+ response[i].writeDate + '</td>' + '<td colspan=3>'
							+ response[i].content + '</td>' + '<td>'
							+ '<a href="/answer/delete/' + response[i].id
							+ '" class="btn btn-danger">' + '삭제' + '</a>'
							+ '</td>' + '</tr>');

		}
	}

});

$('button[type="button"]').on("click", function(e) {
	e.preventDefault();

	if (!check()) {
		answer_write();
	}
});
function check() {
	var con = $('textarea[id="answer"]').val();
	if (con=="") {
		alert("답글 내용이 비어있습니다.");
		return true;
	}

	return false;
}
function answer_write() {

	$('form').attr('action', '/answer/write').attr('method', 'post').submit();
	alert("답글이 등록되었습니다.");

}
