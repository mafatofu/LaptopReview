<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>

  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Blank Page</title>

  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

  <!-- Page level plugin CSS-->
  <link href="resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
 

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin.css?ver=1.6" rel="stylesheet">
  <link href="resources/css/search.css?ver=1.5	" rel="stylesheet">

</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index">LapView</a>

    <button class="btn btn-link btn-sm text-white">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" action="search" onsubmit="return isNull()">
      <div class="input-group">    
        <input type="text" class="form-control" name="searchItem" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
         <div class="input-group-append">
          <button class="btn btn-primary">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

  </nav>

  <div id="wrapper">

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">"${search}"에 대한 검색결과</li>
        </ol>

        <!-- Page Content -->
        <!-- 눌렀을때 해당부분 _ Array 추가 / desc 모드 추가 필요 -->
  	<div class="search-result mx-2">
  		<c:if test="${empty searchList }">
  		검색 결과가 없습니다.
  		</c:if>	
  		<table class="search">
  			<tr class="tr_h">
		<c:url value="search" var="modelnameURL">
			<c:param name="searchItem" value="${search}"></c:param>
			<c:param name="order" value="MODELNAME"></c:param>
		</c:url>  			
  				<td><a href="${modelnameURL}" onclick="javascript:isArray()">모델명</a></td>
		<c:url value="search" var="cpuURL">
			<c:param name="searchItem" value="${search}"></c:param>
			<c:param name="order" value="CPU"></c:param>
		</c:url>    				
  				<td><a href="${cpuURL}">CPU</a></td>
		<c:url value="search" var="displayURL">
			<c:param name="searchItem" value="${search}"></c:param>
			<c:param name="order" value="DISPLAY"></c:param>
		</c:url>   				
  				<td><a href="${displayURL}">화면크기</a></td>
		<c:url value="search" var="weightURL">
			<c:param name="searchItem" value="${search}"></c:param>
			<c:param name="order" value="WEIGHT"></c:param>
		</c:url>     				
  				<td><a href="${weightURL}">무게</a></td>
		<c:url value="search" var="purposeURL">
			<c:param name="searchItem" value="${search}"></c:param>
			<c:param name="order" value="PURPOSE"></c:param>
		</c:url>     				
  				<td><a href="${purposeURL}">용도</a></td>
  			</tr>
		<c:forEach var="list" items="${searchList }">
		<c:url value="result" var="url">
			<c:param name="modelName" value="${list.modelName }"></c:param>
		</c:url>
		<tr>
			<td class="td_col">
				<a href="${url}">${list.modelName }</a>
			</td>
			<td class="td_col">	${list.cpu }&nbsp;&nbsp;</td>
			<td class="td_col"> ${list.display }인치&nbsp;&nbsp;</td>
			<td class="td_col"> ${list.weight }kg&nbsp;&nbsp; </td>
			<td class="td_col"> ${list.purpose }&nbsp;&nbsp;</td>
		</tr>
		</c:forEach>
		</table>
	</div>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
  	function isArray(){
  		
  		
  	}
  	
  </script>

  <!-- Bootstrap core JavaScript-->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="resources/js/sb-admin.min.js"></script>
  <script src="resources/js/common.js"></script>

</body>

</html>
