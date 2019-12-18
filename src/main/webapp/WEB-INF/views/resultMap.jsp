<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
		<div class="resultMap">
			<h2>resultMap</h2>
			<table>
				<tr>
					<th>제조사</th><th>시리즈</th><th>모델명</th>
					<th>cpu</th><th>화면크기</th><th>무게</th>
					<th>목적</th>
				</tr>		
				<c:forEach var="list" items="${modelList }">
				<tr>
					<td>${list.production }</td>
					<td>${list.series }</td>
					<td>${list.modelName }</td>
					<td>${list.cpu }</td>
					<td>${list.display }</td>
					<td>${list.weight }</td>
					<td>${list.purpose }</td>
				</tr>	
				</c:forEach>
			</table>	
		</div>
		
		
	
</body>
</html>