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
		color: #ffffff;
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
	
	.c_contents{
		width: 620px;
		border: 1px solid black;
		margin-left: 240px;
		height: 600px;
		padding: 20px;
		padding-top: 50px;
	}
	
	#del_win{
		display: none;
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
		margin-top: -1011px;
		line-height: 0;
	}
</style>
<link rel="stylesheet" href="css/summernote-lite.css"/>
</head>
<body>
<form action="control" method="post">
<div id="header">
		<h1><a href=""><img  src="css/pmlm_n8cyjwtciedn.png"> </a></h1>
	</div>
	</form>
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
					<td><input type="text" size="40"/> </td>
					<th>date</th>
					<td><input type="text" size="7"/></td>
				</tr>
				<tr>
					<th>writer:</th>
					<td><input type="text" size="40"/></td>
					<th>hit:</th>
					<td><input type="text" size="7"/></td>
				</tr>
				<tr>
				<tr>
					<th>내용:</th>
					<td colspan="3"><textarea rows="8" cols="50" id="content" name="content"></textarea> </td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="보내기" onclick="sendData()" class="btn btn-warning"/>
						<input type="reset" id="reset" value="다시" class="btn btn-info"/>
						<input type="button" id="list" value="목록" class="btn btn-primary"/>
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
	</div>
	<div id="del_win">
		<form>
			<input type="password" id="d_pw" name="d_pw"/><br/><br/>
			<button type="button" id="d_btn" name="d_btn">삭제</button>
			<button type="button" id="d_close" name="d_close">닫기</button><br/><br/>
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
			$("#del").bind("click", function(){
				$("#del_win").dialog();
			});
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
		})
	</script>
</body>
</html>