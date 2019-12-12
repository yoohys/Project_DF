function login(){
	var user = getUser();
	sendUserInfo(user, changeUserInfo);
}

function register(){
	
}

function getUser(){
	return {
		id : $('input[name="id"]').val(),
		pw : $('input[name="pw"]').val()
	}
};

function sendUserInfo(userInfo, successCallback){
	$.ajax({
		url: "/users/login",
		type: "post",
		data: JSON.stringify(userInfo),
		contentType : "application/json; charset=utf-8",
		success : function(result){
			successCallback(result);
		},
		error : function(error){
			console.log(error);
		}
	});
}

function changeUserInfo(user){
	console.log(user);
	$(".userInfo").html(`${user.id} : ${user.pw}`);
}

function showRegisterForm(){
	$(".userInfo").append(`
			<div>
				<input type="text">
				<input type="text">
			</div>
	`);
}