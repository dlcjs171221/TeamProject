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
<link type="text/css" rel="stylesheet" href="css/bbs/bbsfooter.css">

<style type="text/css">
	#menu{
		width: 520px;
		padding: 20px;
		margin-left: 230px;
		margin-top: 30px;
	}
	#m_list li{
		display: inline-block;
		list-style: none;
		width: 88px;
		height: 30px;
		line-height: 0;
		padding-top: 5px;
	}
	#header{
		margin-left: 250px;
		margin-bottom: 25px;
	}
	#m_list a{
		text-decoration: none;
		font-weight: bold;
		color: white;
		color: #ffffff;
	}
	#m_list{
		text-align:center;
		background-color: Orange;
		border: 1px solid black;
		padding-top: -15px; 
		width: 600px;
		height: 30;
		margin-top: -38px;
		background-color: rgba(75, 75, 93, 0.85);
	}
	
	#table1{
		width: 600px;
		border-bottom: 1px solid white;
		margin-top: -10px;
	}
	
	#m_list a:hover {
		color: blue;
		text-decoration: none;
	}
	#tab{
		border: 1px solid black;
	 	height: 660px;
	 	width: 600px;
	 	margin-top: -10px;
	 	margin-left: 250px;
	 	padding-top: 70px;
	 	padding-left: 35px;
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
		margin-top: -1050px;
		line-height: 0;
	}
</style>
<link rel="stylesheet" href="css/summernote-lite.css"/>
</head>
<body>
	
	<div id="header">
		<h1><a href="control?type=maintype=main"><img  src="css/pmlm_n8cyjwtciedn.png"> </a></h1>
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
	<div id="tab">
		<form action="" method="post">
			<table id="table1">
				<tbody>
					<tr>
						<th>제목:</th>
						<td><input type="text" id="title" name="title" size="45"/></td>
					</tr>
					<tr>
						<th>이름:</th>
						<td><input type="text" id="writer" name="writer" size="12"/> </td>
					</tr>
					<tr>
						<th>첨부파일:</th>
						<td><input type="file" id="file" name="file"/> </td>
					</tr>
					<tr>
					<th style="width:83px;">내용:</th>
					<td><textarea rows="8" cols="50" name="content" id="content"></textarea> </td>
				</tr>
				
				</tbody>
				<tfoot>
				<tr></tr>
					<tr>
					<td colspan="3">
						<button type="button" id="send" class="btn btn-warning">보내기</button>
						<input type="reset"  id="reset" class="btn btn-info" value="다시"/>
						<button type="button" id="list" onclick="javascript:location.href='bbslist.jsp'" class="btn btn-primary">목록</button>
					</td>
					</tr>
				</tfoot>
			</table>
		</form>
	
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
		
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/summernote-lite.js"></script>
	<script src="js/lang/summernote-ko-KR.min.js"></script>	
	<script>
	$(function(){
		
		$("#content").summernote({
			height: 300,
			width: 450,
			lang: "ko-KR",
			callbacks:{
				onImageUpload: function(files, editor){
					
					for(var i=0; i<files.length; i++){
						sendFile(files[i], editor);
					}
				},
			}
		});
		
		$("#content").summernote("lineHeight", 1.0);
	});
	</script>
	
</body>
</html>