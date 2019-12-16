//필수사항 중 비어있는 항목이 있는지 체크

function check() {
	var sub = $('input[name="subject"]').val();
	var con = $('input[name="content"]').val();

	// 공백 확인 검사
	var info = {
		sub : sub,
		con : con
	};
	var keys = Object.keys(info);
	console.log(keys);
	for (var i = 0; i < keys.length; i++) {
		if (info[keys[i]] == '') {
			alert(keys[i] + "가 비어있습니다.");
			return true;
		}
	}
	
	return false;
}

// 아이디 중복 체크
// 아이디 중복 : 중복 경고창 띄우고 회원가입창 유지
// 중복 안됨 : DB에 회원 정보 저장 후 메인 페이지로

function write() {
	var id = $('input[name="id"]').val();
	$.ajax({
		url : '/members/register/check/' + id,
		type : 'get',
		dataType : 'json',
		success : function(response) {
			if (response.result == true) {
				alert("아이디 중복");
			} else {
				$('form').attr('action', '/members/register').attr('method',
						'post').submit();
				alert("가입이 완료 되었습니다. \n로그인 해주십시오.");
			}
		},
		fail : function(error) {
		},
		always : function(response) {
		}
	});
}