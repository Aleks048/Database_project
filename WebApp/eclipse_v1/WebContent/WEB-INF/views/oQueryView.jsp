<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>OttawaSpoon - O Query</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ionicons/css/ionicons.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ospoon.css">
		
		<!--=COLORLIB TABLE================================================================================-->
			<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/colorlib/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
			<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/colorlib/animate/animate.css">
			<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/colorlib/select2/select2.min.css">
			<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/colorlib/perfect-scrollbar/perfect-scrollbar.css">
			<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/colorlib/css/colorlib-util.css">
			<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/colorlib/css/colorlib-main.css">
		<!--===============================================================================================-->
		
		<style>
		#myTable {
		    padding-top: 400px;
		}
		</style>
		
		
	</head>

	<body>
		 <nav class="navbar navbar-expand-lg main-navbar">
			<div class="container-fluid">
				<div class="collapse navbar-collapse" id="navbarNav">
					<div class="hero bg-overlay text py-1"> <h1>Query O</h1> </div>
					<div class="mr-auto"></div>	
					
				    <form class="form-inline">
					    <a href="${pageContext.request.contextPath}/query" class="btn smooth-link align-middle btn-primary">Back</a>
				    </form>
			    </div>
		  </div>
		</nav>
		
		<section class="hero bg-overlay" id="login" data-bg="img/hero.jpeg">
			<div class="text py-1">
			<p style="color: red;">${errorString}</p>
			<br>
			<br>
				
		<div>  <!-- class="container-table100" -->
			<div id="myTable">  <!-- class="wrap-table100" -->
			
				<div class="table100 ver3 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th scope="col" class="cell100 column2 text-center">UserID</th>
									<th scope="col" class="cell100 column4 text-center">Deviation</th>
									<th scope="col" class="cell100 column4 text-center">Rater Name</th>
									<th scope="col" class="cell100 column4 text-center">Type</th>
									<th scope="col" class="cell100 column4 text-center">email</th>
									<th scope="col" class="cell100 column2 text-center">Food Rating</th>
									<th scope="col" class="cell100 column4 text-center">Restaurant Name</th>
								</tr>
							</thead>
						</table>
					</div>
					
					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach items="${oBeans}" var="row">
								    <tr class="row100 body">
								      <td class="cell100 column2">${row.userid}</td>
								      <td class="cell100 column4">${row.dev}</td>
								      <td class="cell100 column4">${row.user_name}</td>
								      <td class="cell100 column4">${row.type}</td>
								      <td class="cell100 column4">${row.e_mail}</td>
								      <td class="cell100 column2">${row.food}</td>
								      <td class="cell100 column4">${row.rest_name}</td>
								    </tr>
								  </c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
				
			</div>
		</section>

		<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.easeScroll.js"></script>
		<script src="${pageContext.request.contextPath}/js/ospoon.js"></script>
		<script src="${pageContext.request.contextPath}/js/sweetalert2.all.js"></script>
		
		<!--=COLORLIB TABLE================================================================================-->
			<%-- <script src="${pageContext.request.contextPath}/colorlib/jquery/jquery-3.2.1.min.js"></script> --%>
			<script src="${pageContext.request.contextPath}/colorlib/bootstrap/js/popper.js"></script>
			<%-- <script src="${pageContext.request.contextPath}/colorlib/bootstrap/js/bootstrap.min.js"></script> --%>
			<script src="${pageContext.request.contextPath}/colorlib/select2/select2.min.js"></script>
			<script src="${pageContext.request.contextPath}/colorlib/perfect-scrollbar/perfect-scrollbar.min.js"></script>
			<script>
				$('.js-pscroll').each(function(){
					var ps = new PerfectScrollbar(this);
					$(window).on('resize', function(){
						ps.update();
					})
				});
			</script>
			<script src="js/main.js"></script>
		<!--===============================================================================================-->
		
	</body>
</html>