<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<!-- 인터넷 설정 -->
<meta http-equiv="X-UA-Compatible" content="IE=chrome" />
<!-- 반응형 웹페이지 설정(Bootstrap) -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous">
</script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"
	integrity="sha256-xLD7nhI62fcsEZK2/v8LsBcb4lG7dgULkuXoXB/j91c=" crossorigin="anonymous">
</script>
<!-- DataTables -->
<link href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">
<script src="${root}resources/js/datatables-simple-demo.js"></script>

<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- 위의 탭 아이콘 -->
<link rel="icon" href="${root}resources/assets/img/main_image.png" />

<!-- 스타일 -->
<link href="${root}resources/css/styles.css" rel="stylesheet" />
<link href="${root}resources/css/board.css" rel="stylesheet" />

<!-- 폰트 설정 -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

</head>

<body>
	<!-- 사이드바 리스트 틀 만들기 (아코디언 스타일) -->
	<nav class="sb-sidenav accordion" id="sidenavAccordion"
		style="color: white;">
		<div class="sb-sidenav-menu" style="background-color: white;">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">메인 화면</div>
				<a class="nav-link" href="${root}Admin/AdminDashboard">
					<div class="sb-nav-link-icon">
						<i class="fas fa-chalkboard"></i>
					</div> 메인화면
				</a>
				<div class="sb-sidenav-menu-heading">정보</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseLayouts" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-circle-user"></i>
					</div> 회원 정보
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseLayouts"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link first-nav-link"
							href="${root}Admin/table/AdminBuyerTables">
							<div class="sb-nav-link-icon">
								<i class="fas fa-cart-shopping"></i>
							</div> 등록 회원 리스트
						</a> <a class="nav-link last-nav-link"
							href="${root}Admin/table/AdminSellerTables">
							<div class="sb-nav-link-icon">
								<i class="fas fa-store"></i>
							</div> 블랙 회원 리스트
						</a>
					</nav>
				</div>
				
					<div class="sb-nav-link-icon">
						<i class="fas fa-right-from-bracket"></i>
					</div> 로그아웃
				</a>
			</div>
		</div>
	</nav>
	<script src="${root}resources/js/logout.js"></script>
</body>
</html>