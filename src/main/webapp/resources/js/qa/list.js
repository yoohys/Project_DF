//var url = window.location.pathname;
//url = url.split('/');
//console.log(url);
//var category = url[url.length - 3];
//var page = url[url.length - 2];
//var count = url[url.length - 1];
//
//$.ajax({
//	url : '/posts/'+category+'/'+page+'/'+count,
//	type : 'get',
//	dataType : "json",
//	success : function(response) {
//		console.log(response);
//
//		for (var i = 0; i < response.length; i++) {
//
//			$("table").append(
//					'<tr>' + '<td>' + response[i].id + '</td>'
//							+ '<td id="title">' + '<a href="/post/' + response[i].id + '">'
//							+ response[i].title + '</a>' + '</td>' + '<td>'
//							+ response[i].writer + '</td>' + '<td>'
//							+ response[i].writeDate + '</td>' + '<td>'
//							+ '</td>' + '</tr>');
//		}
//
//	},
//	fail : function(error) {
//		alert('???');
//	},
//	always : function(response) {
//		console.log("call always()");
//	}
//});
$(document).ready(function() {
	$('#example').DataTable({
		"ajax" : "/questions/all",
		"columns" : [ {
			"data" : "id"
		}, {
			"data" : "title",
			"render" : function(data, type, row, meta) {
				return '<a href="/post/' + row.id + '">' + data + "</a>";
			}
		}, {
			"data" : "writer"
		}, {
			"data" : "writeDate"
		} ]
	});
});