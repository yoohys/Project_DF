// 로그인 처리
$('#login-submit').click(function(e) {
		e.preventDefault();
		userId = $("input[name='id']").val();
		password = $("input[name='pw']").val();
		
		if (userId == '') {
			alert('아이디를 입력하세요');
			$("#userid").focus();
		}

		if (password == '') {
			alert('비밀번호를 입력하세요');
			$("#password").focus();
		}
		

		$.ajax({
			url : '/members/signin/' + userId+ '/' +password ,
			type : 'get',
			dataType : "json",
			success : function(response) {
				console.log("hello!");
				console.log(response);
				if (response.id == "") {
					alert('로그인 실패');
				}else {
					$("#loginform").submit();
				}
			},
			fail : function(error) {
				alert('???');
			},
			always : function(response) {
				console.log("call always()");
			}
		});
	
	
	});

