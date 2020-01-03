	$(document).ready(function() {
			$.ajax({
				url : '/posts/1/1/5',
				type : 'get',
				dataType : "json",
				success : function(response) {
					console.log(response);
					for(var i = 0; i < response.length; i++){
						$('#newsBoard tbody').append
						('<tr><td><a href="/post/' + response[i].id 
								+ '">' + response[i].title +'</a></td></tr>');
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
	$(document).ready(function() {
		$.ajax({
			url : '/posts/2/1/5',
			type : 'get',
			dataType : "json",
			success : function(response) {
				console.log(response);
				for(var i = 0; i < response.length; i++){
					$('#freeBoard tbody').append
					('<tr><td><a href="/post/' + response[i].id 
							+ '">' + response[i].title +'</a></td></tr>');
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
	$(document).ready(function() {
		$.ajax({
			url : '/question/1/5',
			type : 'get',
			dataType : "json",
			success : function(response) {
				console.log(response);
				for(var i = 0; i < 5; i++){
					$('#qaBoard tbody').append
					('<tr><td><a href="/question/' + response[i].id 
							+ '">' + response[i].title +'</a></td></tr>');
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