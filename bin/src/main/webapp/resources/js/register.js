//필수사항 중 비어있는 항목이 있는지 체크

function check() {
	var id = $('input[name="id"]').val();
	var pw = $('input[name="pw"]').val();
	var pw2 = $('input[name="pw2"]').val();
	var name = $('input[name="name"]').val();
	var email = $('input[name="email"]').val();
	var tel = $('input[name="tel"]').val();

	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getName = RegExp(/^[가-힣]+$/);
	var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
	var getNum = RegExp(/^[0-9\-]{11,13}$/);

	// 공백 확인 검사
	var info = {
		id : id,
		pw : pw,
		pw2 : pw2,
		name : name,
		email : email
	};
	var keys = Object.keys(info);
	console.log(keys);
	for (var i = 0; i < keys.length; i++) {
		if (info[keys[i]] == '') {
			alert(keys[i] + "가 비어있습니다.");
			return true;
		}

	}
	// 이메일 유효성 검사
	if (!getMail.test(email)) {
		alert("이메일형식에 맞게 입력해주세요");
		$("#email").val("");
		$("#email").focus();
		return true;
	}
	// 비밀번호 유효성검사
	if (!getCheck.test(pw)) {
		alert("비밀번호 형식에 맞게 입력해주세요");
		$("#pw").val("");
		$("#pw").focus();
		return true;
	}
	// 아이디 비밀번호 같음 확인
	if (id == pw) {
		alert("아이디와 비밀번호가 같습니다");
		$("#pw").val("");
		$("#pw").focus();
		return true;
	}
	// 비밀번호 똑같은지
	if (pw != pw2) {
		alert("비밀번호 확인이 맞지 않습니다.");
		$("#pw2").val("");
		$("#pw2").focus();
		return true;
	}
	// 이름 유효성 검사
	if (!getCheck.test(name)) {
		alert("이름형식에 맞게 입력해주세요")
		$("#name").val("");
		$("#name").focus();
		return true;
	}
	// 전화번호 유효성 검사
	if (!getNum.test(tel)) {
		alert("전화번호 형식에 맞게 입력해주세요")
		$("#tel").val("");
		$("#tel").focus();
		return true;
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