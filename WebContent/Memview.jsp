<%@page import="mybatis.dao.MemDAO"%>
<%@page import="mybatis.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
<link rel="stylesheet" href="css/sb-admin-2.min.css"/>
<link rel="stylesheet" href="css/fontawesome/all.min.css"/>
<link rel="stylesheet" href="css/jquery-ui.min.css">
<link type="text/css" rel="stylesheet" href="css/bbs/bbs.css">
<link type="text/css" rel="stylesheet" href="css/bbs/bbsfooter.css">

</head>
<body>
<div class="total">
	<div id="header">
		<h1><a href="control?type=main"><img  src="css/pmlm_n8cyjwtciedn.png"> </a></h1>
	</div>
	<!-- 메뉴 -->
	<section>
		<jsp:include page="menu.jsp"/>
	</section>
	<%
		MemVO vo = null;
		String m_id = request.getParameter("m_id");
		Object obj = MemDAO.getMember(m_id);
		if(obj!= null){
			vo = (MemVO)obj;
	%>
	
	<h3>회원정보</h3>
	<table class="f_contents">
		<tbody>
			<tr>
				<th>아이디:</th>
				<td><%= vo.getM_id() %></td>
			</tr>
			<tr>
				<th>이메일:</th>
				<td><%= vo.getM_email() %></td>
			</tr>
			<tr>
				<th>전화번호:</th>
				<td><%= vo.getM_phone() %></td>
			</tr>
		</tbody>
		<%
		}
		%>
		
		<tfoot>
			<tr>
				<td colspan="3">
				<c:set var="obj"  value="${sessionScope.vo }"/>
					<a href="control?type=medit&m_id=${vo.m_id }" class="btn btn-info">수정</a>
					<a href="control?type=main" class="btn btn-info">홈</a>
					<button type="button" id="del" class="btn btn-info">회원탈퇴</button>
				</td>
			</tr>
		</tfoot>	
	
	</table>
	
	<div id="del_win">
		<form>
			<label for="password">비밀번호:</label>
			<input type="password" id="d_pw" name="d_pw"/><br/><br/>
			<button type="button" id="d_btn" name="d_btn" class="btn btn-warning">삭제</button>
			<button type="button" id="d_close" name="d_close" class="btn btn-warning">닫기</button><br/><br/>
		</form>
	</div>
</div>
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#del").bind("click", function(){
				$("#del_win").dialog();
			});
		})
	</script>
	<div id="footer">
			<div class="footer_area">
				
				<address>
				 서울시 강아지 강아지 망아지 망아지 서울특별시 강남구 영동대로 502 위메프빌딩
				 대표이사: 강아지
					사업자등록번호 : 566-87-01096
				</address> 
				<p class="copyright">
					(주)쇼핑 (대표이사 : 없음) 
				</p>
			</div>
		</div>	
		
		
		
		
		
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#del").bind("click",function(){
				$("#del_win").dialog();
				$("#del_win").dialog("option","width",300);
			});
			$("#d_close").bind("click",function(){
				$("#del_win").dialog("close");
			});
			$("#d_btn").bind("click",function(){
				var pw = 
			});
			
		});
	</script>
</body>
</html>