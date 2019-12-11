//필수사항 중 비어있는 항목이 있는지 체크

function checkEmpty(){
	var id = $('input[name="id"]').val();
	var pw = $('input[name="pw"]').val();
	var name = $('input[name="name"]').val();
	var email = $('input[name="email"]').val();
	
	var info = {
			id : id,
			pw : pw,
			name: name,
			email: email
	};
	
	var keys = Object.keys(info);
	console.log(keys);
	
	for(var i = 0 ; i<keys.length; i++ ){
		if(info[keys[i]]==''){
			alert(keys[i] + "가 비어있습니다.");
			return true;
		}
		
	}
	return false;
}

// 아이디 중복 체크
// 아이디 중복 : 중복 경고창 띄우고 회원가입창 유지
// 중복 안됨 : DB에 회원 정보 저장 후 메인 페이지로

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