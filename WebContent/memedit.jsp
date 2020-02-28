<%@page import="mybatis.vo.MemVO"%>
<%@page import="mybatis.dao.MemDAO"%>
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
<link type="text/css" rel="stylesheet" href="css/bbs/bbs.css">
<link type="text/css" rel="stylesheet" href="css/bbs/bbsfooter.css">

</head>
<body>
<div class="total">
	<div id="header">
		<h1><a href="control?type=main"><img  src="css/pmlm_n8cyjwtciedn.png"> </a></h1>
	</div>
	<div  id="menu">
		<ul id="m_list" class="form-control">
		<li><i class="fab fa-bag"></i> <a href="product_list.jsp?category=com001">컴퓨터</a> </li>       
    	<li><a href="product_list.jsp?category=ele002">가전 제품</a></li>
    	<li><a href="product_list.jsp?category=sp003">스포츠</a></li>
    	<li><a href="product_list.jsp?category=sp004">의류</a> </li>
    	<li> <a href="product_list.jsp?category=sp005">고객지원</a> </li>
		</ul>
	</div>
	<%
		MemVO vo = null;
		String m_id = request.getParameter("m_id");
		Object obj = MemDAO.getMember(m_id);
		if(obj!= null){
			vo = (MemVO)obj;
	%>
	<h3>회원수정</h3>
	<div class="contents">
		<form action="control" method="post">
		<input type="hidden" name="type" value="mem">
		<table>
		<tbody>
		<tr>
			<th><label for="s_name">Name:</label></th>
			<td><input type="text" id="s_name" name="m_name" value="<%= vo.getM_name()%>"/></td>
		</tr>
		<tr>
			<th><label for="s_email">Email:</label></th>
			<td>
			<input type="text" id="s_email" name="m_email" />
			<label for="s_email2">@</label>
			<input type="text" id="s_email2" name="m_email" />
			</td>
		</tr>
		<tr>
			<th><label for="s_phone">Phone:</label></th>
			<td>
				<select id="s_phone" name="m_phone">
					<option>::선택하세요::</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
				</select>
				<label for="s_phone2">-</label>
				<input type="text" id="s_phone2" name="m_phone" size="10"/>
				<label for="s_phone3">-</label>
				<input type="text" id="s_phone3" name="m_phone" size="10"/>
			</td>
		</tr>    
		</tbody>
		<%
		}
		%> 
		</table><br/><br/><br/>
		
		<c:set var="obj"  value="${sessionScope.vo }"/>
			<button type="button" id="edit"  class="btn btn-info">수정</button>&nbsp;&nbsp;
			<a href="control?type=main" class="btn btn-info">홈</a>
			<a href="control?type=myInfo&m_id=${vo.m_id }" class="btn btn-info">취소</a>
		</form>
	</div>
	</div>
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
	<script>
		$(function(){
			
			
			$("#edit").bind("click",function(){
				var id = '${vo.m_id }';
				var name = $("#s_name").val();
				var email = $("#s_email").val();
				var email2 = $("#s_email2").val();
				var phone = $("#s_phone").val();
				var phone2 = $("#s_phone2").val();
				var phone3 = $("#s_phone3").val();
				
				param = "type=meditok&m_id="+encodeURIComponent(id)+"&m_name="+encodeURIComponent(name)+"&m_email="+encodeURIComponent(email)+"&m_email="+encodeURIComponent(email2)+"&m_phone="+encodeURIComponent(phone)+"&m_phone="+encodeURIComponent(phone2)+"&m_phone="+encodeURIComponent(phone3);
				
				if(name.trim().length<1){
					alert("이름을 입력하세요~");
					$("#s_name").focus();
					return;
				}
				$.ajax({
					url: "control",
					type: "post",
					dataType: "json",
					data:param
				}).done(function(data){
					if(data.res == "true"){
						alert("회원수정완료");
						location.href="control?type=myInfo&m_id="+id;
					}
				}).fail(function(err){
					console.log("err");
				});
				
			});
		});
	</script>
</body>
</html>