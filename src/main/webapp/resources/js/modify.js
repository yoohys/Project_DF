function modify() {
	
	var pw = $('input[name="pw"]').val();
	var pw2 = $('input[name="pw2"]').val();
	var name = $('input[name="name"]').val();
	var email = $('input[name="email"]').val();
	var tel = $('input[name="tel"]').val();
	
	// 유효성 검사 예제
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getName = RegExp(/^[가-힣]+$/);
	var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
	var getNum = RegExp(/^[0-9\-]{11,13}$/);
	
	var info = {
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
			
			
			// 비밀번호 유효성검사
			if (!getCheck.test(pw)) {
				alert("비밀번호 형식에 맞게 입력해주세요");
				$("#pw").val("");
				$("#pw").focus();
				return false;
			}
			// 비밀번호 똑같은지
			if (pw != pw2) {
				alert("비밀번호 확인이 맞지 않습니다.");
				$("#pw2").val("");
				$("#pw2").focus();
				return false;
			}
			// 이메일 유효성 검사
			if (!getMail.test(email)) {
				alert("이메일형식에 맞게 입력해주세요");
				$("#email").val("");
				$("#email").focus();
				return false;
			}
			// 이름 유효성 검사
			if (!getCheck.test(name)) {
				alert("이름형식에 맞게 입력해주세요")
				$("#name").val("");
				$("#name").focus();
				return false;
			}
			// 전화번호 유효성 검사
			if (!getNum.test(tel)) {
				alert("전화번호 형식에 맞게 입력해주세요")
				$("#tel").val("");
				$("#tel").focus();
				return false;
			}
			$('form').attr('action', '/members/modify').attr('method','post').submit();
				alert("수정이 완료 되었습니다.");
	
	
}