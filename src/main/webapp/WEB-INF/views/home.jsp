<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- bootstrap-css -->
	<link rel="stylesheet" type="text/css" 
		href="${pageContext.request.contextPath}/resources/dist/css/bootstrap.min.css">
	<!-- js -->
	<script src="<c:url value="/resources/bootstrap-4.4.1/dist/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/bootstrap-4.4.1/site/docs/4.4/assets/js/vendor/jquery.slim.min.js" />"></script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
