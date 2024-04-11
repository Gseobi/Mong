<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<!-- 인터넷 설정 -->
<meta http-equiv="X-UA-Compatible" content="IE=chrome" />
<!-- 반응형 웹페이지 설정(Bootstrap) -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- 위의 탭 이름 설정 -->
<title>夢</title>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"
	integrity="sha256-xLD7nhI62fcsEZK2/v8LsBcb4lG7dgULkuXoXB/j91c="
	crossorigin="anonymous"></script>
<!-- DataTables -->
<link
	href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css">
<script
	src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"
	type="text/javascript"></script>
<!-- DataTables -->
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" type="text/css">
<script
	src="${root}resources/Admin_Resources/js/datatables-simple-demo.js"></script>
<!-- 위의 탭 아이콘 -->
<link rel="icon"
	href="${root}resources/Admin_Resources/assets/img/main_image.png" />
<!-- 스타일 -->
<link href="${root}resources/css/styles.css"
	rel="stylesheet" />
<link
	href="${root}resources/Admin_Resources/css/board.css"
	rel="stylesheet" />
<!-- 폰트 설정 -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<!-- body -->
<body class="sb-nav-fixed">
	<c:import url="/WEB-INF/views/include/top.jsp" />
	<!-- 사이드바 전체적인 큰 틀 -->
	<div id="layoutSidenav">
		<!-- 사이드바 틀 -->
		<div id="layoutSidenav_nav">
			<c:import url="/WEB-INF/views/include/side.jsp" />
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">대시보드</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">대시보드</li>
					</ol>
							
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header"
									style="background-color: #008748; color: white;">
									<i class="fas fa-cart-shopping me-1"></i> <a href="${root}Admin/table/AdminBuyerTables" style="color:white;">구매자 정보</a>
								</div>
								<div class="card-body">
									<table id="buyertablesSimple">
										<thead>
											<tr>
												<th>회원번호</th>
												<th>이름</th>
												<th>아이디</th>
												<th>　</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>회원번호</th>
												<th>이름</th>
												<th>아이디</th>
												<th>　</th>
											</tr>
										</tfoot>
										<tbody>

											<c:forEach var="user" items="${userList}">
												<tr>
													<td>${user.user_num}</td>
													<td>${user.user_name}</td>
													<td>${user.user_id}</td>
													<td><a href="${root}Admin/table/AdminBuyerInfo?user_num=${user.user_num}" class="btn btn-primary btn-sm">정보 수정/삭제</a></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header"
									style="background-color: #008748; color: white;">
									<i class="fas fa-store me-1"></i> <a href="${root}Admin/table/AdminSellerTables" style="color:white;">판매자 정보</a>
								</div>
								<div class="card-body">
									<table id="sellertablesSimple">
										<thead>
											<tr>
												<th>회원번호</th>
												<th>이름</th>
												<th>아이디</th>
												<th>　</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>회원번호</th>
												<th>이름</th>
												<th>아이디</th>
												<th>　</th>
											</tr>
										</tfoot>

										<tbody>
											<c:forEach var="seller" items="${sellerList}">
												<tr>
													<td>${seller.seller_num}</td>
													<td>${seller.seller_name}</td>
													<td>${seller.seller_id}</td>
													<td><a href="${root}Admin/table/AdminSellerInfo?seller_num=${seller.seller_num}" class="btn btn-primary btn-sm">정보 수정/삭제</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 mt-auto">
				<c:import url="/WEB-INF/views/include/top.jsp" />
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${root}resources/Admin_Resources/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		
	</script>
	<script
		src="${root}resources/Admin_Resources/assets/demo/chart-bar-demo.js"></script>
	<script
		src="${root}resources/Admin_Resources/assets/demo/chart-pie-demo.js"></script>
	<script
		src="${root}resources/Admin_Resources/js/simple-datatables.min.js"></script>
	<script
		src="${root}resources/Admin_Resources/js/datatables-simple-demo.js"></script>
</body>

</html>