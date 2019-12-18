<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="org.sweeter.application.model.dto.Member"%>
<%@page import="org.sweeter.application.model.dto.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/write.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../includes/navigation.jspf"%>
	<div class="container">
		<table class="table table-bordered">

			<tbody>
				<div id="list">
					<b>글읽기</b>
				</div>
				<form action="#" method="post" class="was-validated">
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" placeholder="${title }"
							class="form-control" name="title" readonly="readonly" /></td>
					</tr>
					<tr>

						<th>작성자</th>
						<td><input type="text" placeholder="${writer }"
							class="form-control" name="writer" readonly="readonly" /></td>
						<th>수정 시간</th>
						<td><input type="text" placeholder="${modifyDate }"
							class="form-control" name="modifyDate" readonly="readonly" /></td>
					</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea cols="10" placeholder="${content }"
							class="form-control" rows="20" name="content" readonly="readonly"></textarea></td>
<!-- 				나중에 글의 크기에따라 Rows 조정 -->
				</tr>
				<tr>
					<td colspan="4">
						<button type="submit" class="btn btn-primary">Modify</button> <a
						class="btn btn-danger" href="list">List</a>
					</td>
				</tr>
				</form>
			</tbody>
		</table>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/resources/js/read.js"></script>
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
</body>
</html>