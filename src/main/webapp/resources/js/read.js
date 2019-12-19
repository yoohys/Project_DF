<script type="text/javascript">
		$('button[type="submit"]').on(
				"click",
				function(e) {
					e.preventDefault();
					modify();

					$.ajax({
						url : '/posts/' + response.id,
						type : 'get',
						dataType : "json",
						success : function(response) {
							console.log(response);

							$("table").append(
									'<tr>' + '<th>' + '제목' + '</th>' + '<td>'
											+ response.title + '</td>' + '<td>'
											+ response.writer + '</td>'
											+ '<td>' + '작성일' + '</td>' + '<td>'
											+ response.writeDate + '</td>'
											+ '<th>' + '내용' + '</th>' + '<td>'
											+ response.content + '</td>'
											+ '</tr>');

						},
						fail : function(error) {
							alert('???');
						},
						always : function(response) {
							console.log("call always()");
						}
					});
				});
		//암호 확인
	</script>