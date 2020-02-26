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
<link rel="stylesheet" href="css/jquery-ui.min.css">
<link type="text/css" rel="stylesheet" href="css/bbs/bbsfooter.css">

<style type="text/css">
	
	#menu{
		width: 520px;
		padding: 20px;
		margin-left: 230px;
	}
	#menu li{
		height: 40px;
		display: inline-block;
		width: 80px;
		line-height: 0;
	}
	#header{
		padding-left: 250px;
		margin-bottom: 25px;
	}
	#menu a{
		text-decoration: none;
		font-weight: bold;
	}
	#m_list{
		text-align:center;
		background-color: rgba(75, 75, 93, 0.85);
		border: 1px solid black;
		padding-top: -15px; 
		width: 600px;
		height: 30;
		margin-top: -38px;
	}
	#m_list a:hover {
		color: blue;
	}
	#m_list a{
		width: 50px;
		text-decoration: none;	
		color: white;
	}
	
	#individual_id{
		display: inline-block;
		margin-left: 50px;
		height: 170px;
		padding-top: 30px;
		padding-left: 10px;
		width: 250px;
		border-collapse: collapse; 
		border: 1px solid black;
	}
	
	
	#business_id{
		display: inline-block;
		margin-left: 18px;
		height: 170px;
		padding-top: 30px;
		padding-left: 10px;
		width: 262px;
		border-collapse: collapse; 
		border: 1px solid black;
	}
	#in_tag{
		display: inline-block;
		margin-left: 50px;
		width: 260px;
	}
	#bs_id{
		display: inline-block;
		padding-left: 8px;
	}
	#as{
		width: 200px;
		float: left;
		background: #ccc;
		height: 900px;
		margin-top: -150px;
		line-height: 0;
	}
	#as2{
		width: 200px;
		float: right;
		background: #ccc;
		height: 900px;
		margin-top: -750px;
		line-height: 0;
	}
</style>
</head>
<body>
	<div id="header">
		<h1><a href="control?type=main"><img  src="css/pmlm_n8cyjwtciedn.png"> </a></h1>
	</div>
	<div  id="menu">
		<ul id="m_list" class="form-control">
			<li><a href="#">베스트</a></li>
			<li><a href="#">투데이특가</a></li>
			<li><a href="#">마트워크</a></li>
			<li><a href="#">내일특가</a></li>
			<li><a href="#">원더배송</a></li>
		</ul>
	</div>
	<aside id="as"></aside>
	<div id="in_tag">
			<h2>개인 사용자</h2>
	</div>
	<div id="bs_id">
		<h2>기업 사용자</h2>
	</div>
	<div id="total">
	<div id="individual_id">
		<form action="" method="post">
		<table id="individual_table">
			
			<tr>
				<td><label id="in_id">ID:</label> </td>
				<td><input type="text" id="in_id" name="in_id" size="15" placeholder="아이디를 입력하세요"/> </td>
			</tr>
			<tr>
				<td><label id="m_pw">PW:</label> </td>
				<td><input type="password" id="in_pw" name="in_pw" size="15" placeholder="비밀번호를 입력하세요"/> </td>
			</tr>
			
			<tr>
				<td><button type="button" id="in_login" onclick="" class="btn btn-primary">로그인</button> </td>
				<td><button type="button" id="in_registry" onclick="javascript:location.href='Registry.jsp'" class="btn btn-success">회원가입</button> </td>
			</tr>
		</table>
		</form>
	</div>
	<div id="business_id">
		<table>
			<tr>
				<td><label id="bs_id">ID:</label> </td>
				<td><input type="text" id="bs_id" name="bs_id" size="15" placeholder="아이디를 입력하세요"/> </td>
			</tr>
			<tr>
				<td><label id="bs_pw">PW:</label> </td>
				<td><input type="password" id="bs_pw" name="bs_pw" size="15" placeholder="비밀번호를 입력하세요"/> </td>
			</tr>
			
			<tr>
				<td><button type="button" id="bs_login" onclick="" class="btn btn-primary">로그인</button> </td>
				<td><button type="button" id="bs_registry" onclick="javascript:location.href='Registry.jsp'" class="btn btn-success">회원가입</button> </td>
			</tr>
		</table>
		
	</div>
	</div>
	<br/><br/><br/><br/>
	
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