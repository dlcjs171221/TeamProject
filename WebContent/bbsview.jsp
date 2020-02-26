<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
<link rel="stylesheet" href="css/sb-admin-2.min.css"/>
<link rel="stylesheet" href="css/fontawesome/all.min.css"/>
<link rel="stylesheet" href="css/jquery-ui.min.css">
<link type="text/css" rel="stylesheet" href="css/bbs/bbsfooter.css">
<style type="text/css">
	#menu{
		width: 600px;
		padding: 20px;
		margin-left: 230px;
		margin-top: 30px;
	}
	#m_list{
		text-align:center;
		border: 1px solid black;
		padding-top: -15px; 
		width: 600px;
		height: 30;
		margin-top: -38px;
		background-color: rgba(75, 75, 93, 0.85);
	}
	li{
		display: inline-block;
		list-style: none;
		width: 88px;
		height: 30px;
		line-height: 0;
		padding-top: 5px;
	}
	#header{
		margin-left: 250px;
	}
	.total{
		background-image: url("../../css/banner.jpg")
	}
	a{
		text-decoration: none;
		font-weight: bold;
		color: #ffffff;
	}
	ul{
		text-align:center;
		background-color: Orange;
		border: 1px solid black;
		padding-top: 15px; 
		width: 600px;
		height: 30;
		margin-top: -38px;
	}
	
	
	.c_contents{
		width: 600px;
		border: 1px solid black;
		margin-left: 250px;
		height: 500px;
		padding: 50px;
	}
	
	#del_win{
		display: none;
	}
	#m_list a:hover {
		color: blue;
		text-decoration: none;
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
		margin-top: -660px;
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
		<li><i class="fab fa-bag"></i> <a href="product_list.jsp?category=com001">컴퓨터</a> </li>       
    	<li><a href="product_list.jsp?category=ele002">가전 제품</a></li>
    	<li><a href="product_list.jsp?category=sp003">스포츠</a></li>
    	<li><a href="product_list.jsp?category=sp004">의류</a> </li>
    	<li> <a href="product_list.jsp?category=sp005">고객지원</a> </li>
		</ul>
	</div>
	<aside id="as"></aside>
	<div class="c_contents">
		<form action="" method="post">
		<table>
		<colgroup>
			<col width="100px"/>
			<col width="*"/>
			<col width="60px"/>
			<col width="100px"/>
		</colgroup>
			<tbody>
				<tr>
					<th>Title:</th>
					<td></td>
					<th>date</th>
					<td></td>
				</tr>
				<tr>
					<th>writer:</th>
					<td></td>
					<th>hit:</th>
					<td></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td colspan="3"><textarea rows="8" cols="50"></textarea> </td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<button type="button" id="edit" onclick="" class="btn btn-info">EDIT</button>
						<button type="button" id="del" onclick="" class="btn btn-warning">Delete</button>
						<button type="button" id="list" onclick="" class="btn btn-danger">List</button>
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
	</div>
	<div id="del_win">
		<form>
			<label for="password">비밀번호:</label>
			<input type="password" id="d_pw" name="d_pw"/><br/><br/>
			<button type="button" id="d_btn" name="d_btn" class="btn btn-warning">삭제</button>
			<button type="button" id="d_close" name="d_close" class="btn btn-warning">닫기</button><br/><br/>
		</form>
	</div>
	<aside id="as2"></aside>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
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
			});
		</script>
</body>
</html>