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
					<input type="hidden" name="id" value="${post.id}">
					<tr>
						<th>제목</th>
						<td colspan="3"><input id="title" type="text"
							class="form-control" name="title" value="${post.title}" /></td>
					</tr>
					<tr>

						<th>작성자</th>
						<td><input type="text" "
							class="form-control"
							name="writer" readonly="readonly" value="${post.writer}" /></td>
						<th>수정 시간</th>
						<td><input type="text" "
							class="form-control"
							name="modifyDate" readonly="readonly" value="${post.modifyDate}" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea id="content" cols="10"
								class="form-control" rows="20" name="content">${post.content}</textarea></td>
						<!-- 				나중에 글의 크기에따라 Rows 조정 -->
					</tr>
					<tr>
						<td colspan="4">
							<button type="submit" class="btn btn-primary">Modify</button> <a
							class="btn btn-primary" href="/post/list/2/1/10">List</a> <a
							class="btn btn-danger" href="/post/delete/${post.id}">Delete</a>
						</td>
					</tr>
				</form>
			</tbody>
		</table>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/resources/js/post-modify.js"></script>



</body>
</html>