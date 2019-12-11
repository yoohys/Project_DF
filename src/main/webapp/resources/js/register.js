//필수사항 중 비어있는 항목이 있는지 체크

function checkEmpty(){
	
}

//아이디 중복 체크
//아이디 중복 : 중복 경고창 띄우고 회원가입창 유지
//중복 안됨 : DB에 회원 정보 저장 후 메인 페이지로

function register() {
	var id = $('input[name="id"]').val();
	$.ajax({
		url : '/members/register/check/' + id,
		type : 'get',
		dataType : 'json',
		success : function(response) {
			if (response.result == true) {
				alert("아이디 중복");
			} else {
				$('form')
				.attr('action', '/members/register')
				.attr('method','post')
				.submit();
			}
		},
		fail : function(error) {
		},
		always : function(response) {
		}
	});
}