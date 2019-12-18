$.ajax({
	url : '/posts/2/1/10',
	type : 'get',
	dataType : "json",
	success : function(response) {
		console.log(response);

		for (var i = 0; i < response.length; i++) {

			$("table").append(
					'<tr>' + '<td>' + response[i].id + '</td>'
							+ '<td id="title">' + '<a href="/post/read/">'
							+ response[i].title + '</a>' + '</td>' + '<td>'
							+ response[i].writer + '</td>' + '<td>'
							+ response[i].writeDate + '</td>' + '<td>'
							+ '</td>' + '</tr>');
		}

	},
	fail : function(error) {
		alert('???');
	},
	always : function(response) {
		console.log("call always()");
	}
});
