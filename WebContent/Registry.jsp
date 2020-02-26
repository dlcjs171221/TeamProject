<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<aside id="as"></aside>
	<h3>회원가입</h3>
	<div class="contents">
		<form action="control" method="post">
		<table>
		<tr>
			<th><label for="s_id">ID:</label></th>
			<td><input type="text" id="s_id" name="s_id" placeholder="아이디를 입력하세요"/><div id="box"></div></td>
			
		</tr>
		
		<tr>
			<th><label for="s_pw">PW:</label></th>
			<td><input type="password" id="s_pw" name="s_pw" placeholder="영문/숫자 조합 6~15자"/></td>
		</tr>
		<tr>
			<th><label for="s_name">Name:</label></th>
			<td><input type="text" id="s_name" name="s_name" placeholder="아이디를 입력하세요"/></td>
		</tr>
		<tr>
			<th><label for="s_email">Email:</label></th>
			<td>
			<input type="text" id="s_email" name="s_email"/>
			<label for="email2">@</label>
			<input type="text" id="email2" name="email"/>
			</td>
		</tr>
		<tr>
			<th><label for="s_phone">Phone:</label></th>
			<td>
				<select>
					<option>::선택하세요::</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
				</select>
				<label for="s_phone2">-</label>
				<input type="text" id="s_phone2" name="s_phone" size="10"/>
				<label for="s_phone3">-</label>
				<input type="text" id="s_phone3" name="s_phone" size="10"/>
			</td>
		</tr>
		</table><br/><br/><br/>
		<button type="button" id="registry" onclick="type=" class="btn btn-info">Registry</button>&nbsp;&nbsp;
		<button type="button" id="cancle" onclick="javascript:location.href='bbslogin.jsp'" class="btn btn-success">Cancle</button>
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
		<aside id="as2"></aside>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>