$(function() {
	// 로그인 처리
	$('#login-submit').click(function(e) {
		e.preventDefault();

		$.ajax({
			url : 'loginChk.php',
			type : 'POST',
			data : {
				userid : $('#userid').val(),
				password : $('#password').val()
			},
			dataType : "json",
			success : function(response) {
				if (response.result == 1) {
					// alert('로그인 성공');
					location.replace('../index.php'); // 화면 갱신
					// location.reload(); // 화면 갱신
				} else if (response.result == -2) {
					alert('입력된 값이 없습니다');
				} else {
					alert('로그인 실패');
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("arjax error : " + textStatus + "\n" + errorThrown);
			}
		});
	});

});
