<%@page import="mybatis.vo.WbsVO"%>
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
	
	<%
		Object obj = request.getAttribute("vo");
		if(obj != null){
			WbsVO vo = (WbsVO)obj;
	%>
	
	
	<div id="tab">
		<form action="control?type=fedit" method="post" enctype="multipart/form-data">
			
			<input type="hidden" name="b_idx" value="${param.b_idx }"/>
			<input type="hidden" name="cPage" value="${param.cPage }"/>
		
			<table id="table1">
				<tbody>
					<tr>
						<th>제목:</th>
						<td><input type="text" id="title" name="title" size="45"
							value="<%=vo.getSubject()%>"/></td>
					</tr>
					<tr>
						<th>이름:</th>
						<td><input type="text" id="writer" name="writer" size="12"
							value="<%=vo.getWriter()%>"/> </td>
					</tr>
					<tr>
						<th>첨부파일:</th>
						<td><input type="file" id="file" name="file"/> 
						<%
							if(vo.getFile_name() != null && vo.getFile_name().trim().length() > 4){
						%>
						(<%=vo.getFile_name() %>)	
						<%		
							}
						%>
						</td>
					</tr>
					<tr>
					<th>비밀번호:</th>
					<td><input type="password" name="pwd" size="12"/></td>
					</tr>
				
				</tbody>
			</table>
			<%--내용의 값을 받기위한 input태그 --%>
			<input type="hidden" name="content" id="str"/>
		</form>
		
			<table>
				<tbody>
				<tr>
					<th style="width:83px;">내용:</th>
					<td><textarea rows="8" cols="50" name="content" id="content" ><%=vo.getContent()%></textarea></td>
				</tr>
					<tr>
					<td colspan="3">
						<button type="button" id="send" class="btn btn-warning"
						onclick="saveData()">저장</button>
						<input type="reset"  id="reset" class="btn btn-info" value="다시"/>
						<button type="button" id="list" onclick="javascript:document.location.href='control?type=flist'" class="btn btn-primary">목록</button>
					</td>
					</tr>
				</tbody>
			</table>
	
	</div>
	
	<%		
		}
	%>
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
	
	function sendFile(file, editor){
		//이미지를 서버로 업로드 시키기 위해
		//비동기식 통신을 수행하자!
		
		//파라미터를 전달하기 위해 폼객체 준비
		var frm = new FormData(); //<form encType="multipart/formData"></form>
		
		//보내고자 하는 자원을 파라미터 값으로 등록(추가)
		frm.append("upload", file);
		
		//비동기식 통신
		$.ajax({
			url : "control?type=saveImage",
			type : "post",
			dataType : "json",
			//파일을 보낼 때는 일반적인 데이터 전송이 아님을 증명해야 한다.
			contentType : false,
			processData : false,
			data : frm //upload와 str이 담겨져 보내진다.
		}).done(function(data){
			
			$("#content").summernote("editor.insertImage", data.url);
			
		}).fail(function(err){
			console.log(err);
		});
	}
	
	function saveData(){
		for(var i=0; i<document.forms[0].elements.length; i++){
			
			//만약 제목과 이름만 입력되었는지 유효성 검사를 한다면...
			if(i > 1)
				break;
			
			if(document.forms[0].elements[i].value == ""){
				alert(document.forms[0].elements[i].name+"를 입력하세요");
				document.forms[0].elements[i].focus();
				return; //수행중단
			}
		}
		
		//str의 내용의 값을 넣어준다.
		var str = $("#content").val();
		
		//form안에 숨겨놓은 input태그에 내용의 값을 넣어준다.
		$("#str").val(str);
		
		document.forms[0].submit();
	}
	</script>
	
</body>
</html>