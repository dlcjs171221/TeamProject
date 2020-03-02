<%@page import="wbs.util.Paging"%>
<%@page import="mybatis.vo.WbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
	Object f_obj = null;
	Object a_obj = null;
	Object n_obj = null;
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/jquery-ui.min.css"/>
<link rel="stylesheet" href="css/fontawesome/all.min.css" />
</head>
<body>
	<!-- header -->
	<header id="header">
		<div class="inner">
			<a class="logo" href="control">
				<img src="css/pmlm_n8cyjwtciedn.png">
			</a>
			
			<c:set var="obj"  value="${sessionScope.vo }"/>
			<c:if test="${obj == null }">
				<a href="control?type=login">sign in</a>
				<a href="control?type=reg">Registry</a>
			</c:if>
			<c:if test="${obj != null }">
				<c:set var="vo" value="${obj }" />
				<span>${vo.m_name }(${vo.m_id })님 환영합니다!</span>
				<a href="control?type=myInfo&m_id=${vo.m_id }">내정보</a>
				<a href="control?type=logout">sign out</a>
			</c:if>
			
			<button type="button" id="search_btn" class="button small">Search</button>
		</div>
		
		<div id="dialog">
			<form action="control?type=search" method="post">
				<fieldset>
				
					<select id="v1" name="searchType">
						<option>::선택하세요::</option>
						<option value="0">전체</option>
						<option value="1">제목</option>
						<option value="2">글쓴이</option>
					</select>
					<br/>
					<input type="text" id="v2" name="searchValue"
						placeholder="검색어를 입력하세요">
					<br/>
					<button type="button" id="search_btn" class="button small">
						<i class="fas fa-search"></i> Search
					</button>
				</fieldset>
			</form>
		</div>
					
	</header>
	
	<section id="banner">
		
	</section>
	
	<!-- 메뉴 -->
	<section>
		<jsp:include page="menu.jsp"/>
	</section>

	<!-- 첫번째 게시물들 -->
	<div id="contents">	
		<div class="info_one ">
			<div class="pick">
				<%
					f_obj = request.getAttribute("f_ar");
					if(f_obj != null) {
						WbsVO[] vo = (WbsVO[]) f_obj;
						
						int i = vo.length-1;
						WbsVO wbs = vo[i];
				%>
				<div class="main_free" onclick="javascript: document.location.href='control?type=fview&b_idx=<%=wbs.getB_idx() %>'">
					<strong class="title m">
						<span class="sub"><%=wbs.getSubject() %></span>
					</strong> 
					<div class="con_area">
						<span class="inner_con"> <%=wbs.getContent() %></span>
					</div>
					<footer>
						<em class="name"> 
							<%=wbs.getWriter() %>
						</em>
					</footer>
					<%
						}
					%>
				</div>
			</div >

			<div class="pick">
				<%
						a_obj = request.getAttribute("a_ar");
						if(a_obj != null) {
							WbsVO[] vo = (WbsVO[]) a_obj;
							
							int i = vo.length-1;
							WbsVO wbs = vo[i];
				%>
				<div class="main_ann" onclick="javascript: document.location.href='control?type=aview&b_idx=<%=wbs.getB_idx() %>'">
					<strong class="title m">
						<span class="sub"><%=wbs.getSubject() %></span> 
					</strong> 
					<div class="con_area">
						<span class="inner_con"> <%=wbs.getContent() %></span>
					</div>
						<footer>
							<em class="name"><%=wbs.getWriter() %></em>
						</footer>
					<%
						}
					%>
				</div>
			</div>

			<div class="pick">
			<%
					n_obj = request.getAttribute("n_ar");
					if(n_obj != null) {
						WbsVO[] vo = (WbsVO[]) n_obj;
						
						int i = vo.length-1;
						WbsVO wbs = vo[i];
			%>
				<div class="main_news" onclick="javascript: document.location.href='control?type=nview&b_idx=<%=wbs.getB_idx() %>'">
					<strong class="title m">
						<span class="sub"> <%=wbs.getSubject() %> </span> 
					</strong> 
					<div class="con_area">
						<span class="inner_con"><%=wbs.getContent() %> </span>
					</div>
					<footer>
						<em class="name"> <%=wbs.getWriter() %></em>
					</footer>	
				<%
					} else{
				%>			
						<div>
							게시글이 없습니다
						</div>				
				<%	}
				%>	
				</div>
			</div>

		</div>
		
		
		<!-- 리스트 -->
		<section class="wrapper align-center" id="list">
			<article class="arti">
				<div class="table-wrapper">
					<p class="title">자유게시판</p>
					<span class="more_view">
						<a href="control?type=free">more</a>
					</span>
					<ul class="free">
					<%
						if(f_obj != null) {
							WbsVO[] f_ar = (WbsVO[]) f_obj;
							int cnt =0;
							
							for(WbsVO vo : f_ar){
					%>
							<li>
								<a href="control?type=fview&b_idx=<%=vo.getB_idx() %>">
									<%=vo.getSubject() %>
								</a>
								<span class="date">
									<%=vo.getWrite_date().substring(0, 10) %>
								</span>
							</li>
						<%	++cnt; 
							}
						%>
					</ul>
					<%   }else{
					%>
						<div class="inner table">
							<p class="nullWbs"> 등록된 게시물이 없습니다.</p>
						</div>
					<%
						}
					%>
			
					
				</div>
			</article>
			
			
			<article class="arti">
				<div class="table-wrapper">
					<p class="title">공지사항</p>
					<span class="more_view">
						<a href="control?type=ann">more</a>
					</span>
					<ul class="ann">
					<%
						if(a_obj != null) {
							WbsVO[] ar = (WbsVO[]) a_obj;
							int cnt =0;
						
							for(WbsVO vo : ar){
					%>
							<li>
								<a href="control?type=aview&b_idx=<%=vo.getB_idx() %>">
									<%=vo.getSubject() %>
								</a>
								<span class="date">
									<%=vo.getWrite_date().substring(0, 10) %>
								</span>
							</li>
					<%
						++cnt;
							}
					%>		
						</ul>
					<%	}else{
					%>		
						<div class="inner table">
							<p class="nullWbs"> 등록된 게시물이 없습니다.</p>
						</div>
					<%		
						}
					%>	
				</div>
			</article>
			
			<article class="arti">
				<div class="table-wrapper">
					<p class="title">뉴스</p>
					<span class="more_view">
						<a href="control?type=news">more</a>
					</span>
						<ul class="free">
					<%
						if(n_obj != null) {
							WbsVO[] ar = (WbsVO[]) n_obj;
							int cnt =0;
							for(WbsVO vo : ar) {
					%>	
							<li>
								<a href="control?type=nview&b_idx=<%=vo.getB_idx() %>">
									<%=vo.getSubject() %>
								</a>
								<span class="date">
									<%=vo.getWrite_date().substring(0, 10) %>
								</span>
							</li>
					<%
						++cnt;
							}
					%>		
						</ul>
					<%	}else{
					%>		
						<div class="inner table">
							<p class="nullWbs"> 등록된 게시물이 없습니다.</p>
						</div>
					<%		
						}
					%>	
				</div>
			</article>
		</section>
	</div>
	
	
	



	<!-- Scripts -->
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script>
		$(function (){
			$("#search_btn").bind("click", function(){
				$("#dialog").dialog({
					width: "700",
					margin: "15% auto",
					title: "검색"
				});
				
				var idx = ("#v1").selectedIndex;
				if(idx == 0) // "::선택하세요::"를 선택한 경우
					return;
				
			});			
			
			
			
		});
		
		
	</script>	

</body>
</html>






























