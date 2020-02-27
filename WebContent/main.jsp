<%@page import="mybatis.vo.WbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/jquery-ui.min.css"/>
<link rel="stylesheet" href="css/sb-admin-2.min.css" />
<link rel="stylesheet" href="css/fontawesome/all.min.css" />
</head>
<body>

	<!-- header -->
	<header id="header">
		<div class="inner">
			<a class="logo" href="control"><strong>LOGO</strong></a>
			
			<c:set var="obj"  value="${sessionScope.vo }"/>
			<c:if test="${obj == null }">
				<a href="control?type=login">sign in</a>
				<a href="control?type=reg">Registry</a>
			</c:if>
			<c:if test="${obj != null }">
				<c:set var="vo" value="${obj }" />
				<span>${vo.m_name }(${vo.m_id })님 환영합니다!</span>
				<a href="control?type=m_id">내정보</a>
				<a href="control?type=logout">sign out</a>
			</c:if>
			
			
			
			<button type="button" id="search_btn" class="button small">Search</button>
		</div>
		
		<div id="dialog">
			<form action="">
				<input type="text" id="search_bar" value="" placeholder="검색어를 입력하세요">
				<button type="button" id="search_btn" class="button small">
					<i class="fas fa-search"></i> Search
				</button>
				
			</form>
		</div>
					
	</header>
	
	<section id="banner">
		<img alt="배너사진" src="img/banner.jpg">
	</section>
	
	<!-- 메뉴 -->
	<section>
		<jsp:include page="menu.jsp"/>
	</section>

	<!-- 첫번째 게시물들 -->
	<section>
		<div class="inner">
			<div class="flex ">
				<div class="main_bbs">
					<p>자유 게시판의 첫번째 게시물</p>
				</div >

				<div class="main_bbs">
					<p>공지사항의 첫번째 게시물</p>
				</div>

				<div class="main_bbs">
					<p>뉴스와 이슈의 첫번째 게시물</p>
				</div>

			</div>
		</div>
	</section>
	
	<!-- 리스트 -->
	<section class="wrapper align-center" id="three">
		<div class="inner">
		
			<article>
				<div class="table-wrapper">
					<p class="title">자유게시판</p>
					<span class="more_view">
						<a href="control?type=free">more</a>
					</span>
				<c:choose>
					<c:when test="${requestScope.f_ar != null}">
						<ul class="free">
					<%
						WbsVO[] ar = null;
						Object ar_obj = request.getAttribute("ar");
						
						if(ar_obj != null) {
							ar = (WbsVO[]) ar_obj;
							
							for(WbsVO vo : ar) {
					%>			
							<li>
								<a href="control?type=free&b_idx=<%=vo.getB_idx() %>">
									<%=vo.getSubject() %>
									<%
										if(vo.getC_list().size() > 0){
									%>		(<%=vo.getC_list().size() %>)
									<%		
										}
									%>
								</a>
								<span class="date"></span>
							</li>
					<%
							}
						}
					%>		
						</ul>
					</c:when>	
					
					<c:when test="${requestScope.f_ar == null}"> 
						<div class="inner">
							<p class="nullWbs"> 등록된 게시물이 없습니다.</p>
						</div>
					</c:when>
				</c:choose>	
				</div>
			</article>
			
			
			<article>
				<div class="table-wrapper">
					<p class="title">공지사항</p>
					<span class="more_view">
						<a href="control?type=ann">more</a>
					</span>
				<c:choose>
					<c:when test="${requestScope.a_ar != null}">
						<ul class="free">
							<li>
								<a href="">
							
								</a>
								<span class="date">2016.04.05</span>
							</li>
							<li>
								<a href="">
									게시물2
								</a>
								<span class="date">2016.03.30</span>
							</li>
							<li>
								<a href="">
								게시물3
								</a>
								<span class="date">2016.03.29</span>
							</li>
						</ul>
					</c:when>
					
					<c:when test="${requestScope.a_ar == null}"> 
						<div class="inner">
							<p class="nullWbs"> 등록된 게시물이 없습니다.</p>
						</div>
					</c:when>
				</c:choose>	
				</div>
			</article>
			
			
			<article>
				<div class="table-wrapper">
					<p class="title">뉴스</p>
					<span class="more_view">
						<a href="control?type=news">more</a>
					</span>
				<c:choose>	
					<c:when test="${requestScope.n_ar != null}">
					<c:set var="n_ar" value="${requestScope.n_ar }" />
						<ul class="free">
							<li>
								<a href="">
									
								</a>
								<span class="date">2016.04.05</span>
							</li>
							<li>
								<a href="">
									게시물2
								</a>
								<span class="date">2016.03.30</span>
							</li>
							<li>
								<a href="">
								게시물3
								</a>
								<span class="date">2016.03.29</span>
							</li>
						</ul>
					</c:when>
					
					<c:when test="${requestScope.a_ar == null}">
						<div class="inner">
							<p class="null"> 등록된 게시물이 없습니다.</p>
						</div>
					</c:when>
				</c:choose>	
				</div>
			</article>
		</div>
	</section>




	<!-- Scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/skel.min.js"></script>
	<script src="js/util.js"></script>
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/main.js"></script>
	<script>
		$(function (){
			$("#search_btn").bind("click", function(){
				$("#dialog").dialog({
					width: "700",
					modal: true,
					margin: "15% auto"
					
				});
			});			
			
			
			
			
		});
	</script>	

</body>
</html>






























