$('button[type="submit"]').on("click", function(e) {
	e.preventDefault();
	modify();

});

function modify() {

	var tit = $('input[name="title"]').val();
	var con = $('input[name="content"]').val();

	// 공백 확인 검사
	var info = {
		제목 : tit,
		내용 : con
	};
	var keys = Object.keys(info);
	console.log(keys);
	for (var i = 0; i < keys.length; i++) {
		if (info[keys[i]] == '') {
			alert(keys[i] + "이 비어있습니다.");
			return false;
		}
	}

	$('form').attr('action', '/post/modify').attr('method', 'post').submit();
	
	alert("글이 수정되었습니다.");

}