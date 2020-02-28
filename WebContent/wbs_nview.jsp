<%@page import="mybatis.vo.WbsVO"%>
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
<link rel="stylesheet" href="css/summernote-lite.css">
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
		margin-top: -1010px;
		line-height: 0;
	}
	#comm{
		width: 600px;
		margin-left: 250px;
	}
	#comm_body{
		margin-left: 250px;
		width: 1000px;
		padding-left: 100px;
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
    	<link rel="stylesheet" href="css/summernote-lite.css">
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
		<%
		
				String nowPage = request.getParameter("nowPage");
				String b_idx = request.getParameter("b_idx");

				Object obj = request.getAttribute("vo");
				
				
				if( obj != null){
			
					WbsVO vo = (WbsVO)obj;
					
		%>
				<tr>
					<th>Title:</th>
					<td><%=vo.getSubject() %></td>
					<th>date</th>
					<td><%=vo.getWrite_date().substring(0,10) %></td>
				</tr>
				<tr>
					<th>writer:</th>
					<td><%=vo.getWriter() %></td>
					<th>hit:</th>
					<td><%=vo.getHit() %></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td colspan="3"><textarea rows="8" cols="50" id="content"><%=vo.getContent() %></textarea></td>
				</tr>
			</tbody>
	<%
			}
				
	%>
			<tfoot>
				<tr>
					<td colspan="4">
						<button type="button" id="edit" onclick="" class="btn btn-info">EDIT</button>
						<button type="button" id="del" onclick=""  class="btn btn-warning">Delete</button>
						<button type="button" id="list" onclick="" class="btn btn-danger">List</button>
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
	</div>
	<div id="comm">
		<table>
		<thead>
			<tr>
				<th> <h2>댓글</h2> </th>
			</tr>
		</thead>
		
			<tbody id="comm_body">
				<tr>
					<th><h3> <label for="title">제목:</label></h3> </th>
					<td><input type="text" id="title" name="title" size="20"/> </td>
				</tr>
				<tr>
					<th><h3><label for="writer">작성자:</label> </h3></th>
					<td><input type="text" id="writer" name="writer"size="20"> </td>
				</tr>
				<tr>
					<td><button type="button" id="comm_ok" name="comm_ok" class="btn btn-info">작성</button></td>
				</tr>
			</tbody>
		</table>
	</div>
	<hr/><hr/>
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
	<script src="js/summernote-lite.js"></script>
	<script src="js/lang/summernote-ko-KR.min.js"></script>
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
		<script src="js/summernote-lite.js"></script>
		<script src="js/lang/summernote-ko-KR.min.js"></script>
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
					var b_idx = $("#b_idx").val();
					var pw = $("#d_pw").val();
					var nowPage = $("#cPage").val();
					
					var d_pw = $("#d_pw").val();
					
					
					if(d_pw == pw ){
						var chk = confirm("삭제하시겠습니까???");
						
						if(chk == true){
						
							location.href="control?type=ndel&cPage="+cPage+"&b_idx="+b_idx+"&pw="+pw;
							//type = fdel 로 property추가
							
						}
					}
				});
			});

			$(function() {
				$("#content").summernote({
					height: 180, width: 400, lang:"ko-KR", 
					callbacks:{ 
						onImageUpload: function(files, editor){
							//이미지가 에디터에 추가 될때마다 수행하는 곳
							//console.log("ttttttttt");
							//이미지를 첨부하면 배열로 인식된다.
							//이것을 서버로 비동기식통신을 수행하는 함수를 호출하여 업로드시킨다.
							for(var i=0; i<files.length; i++){
								sendFile(files[i],editor);
							}
						} 
					} 
				});
				
				$("#content").summernote("lineHeight",1.0);
			});
			function sendFile(file,editor){
				//이미지를 서버로 업로드 시키기위해 비동기식 통신을 수행하자
				
				//파라미터를 전달하기위해 폼객체 준비.
				var frm = new FormData(); //<form encType='multipart/form-data'></form>
				
				//보내고자하는 자원을 파라미터 값으로 등록(추가)
				frm.append("upload",file);
				
				//비동기식 통신
				$.ajax({
					url: "control?type=saveImage",	//요청할 URL
					type: "post",		//get, post 중 전송방식을 선택한다.
					dataType: "json",	//서버에서 받을 데이터 형식을 지정한다.	지정하지 않으면 MIME 타입을 참고하여 자동 파싱된다.
					
					// 파일을 보낼 때는 일반적인 데이터 전송이 아님을 증명해야 한다.
					
					contentType: false, //해더의 Content-Type을 설정한다.

					processData: false, //데이터를 querystring 형태로 보내지 않고 DOMDocument 또는 다른 형태로 보내고 싶으면 false로 설정한다.

					//data: "v1="+encodeURIComponent(값)
					data: frm //서버로 보낼 데이터
					
				}).done(function(data){
					//console.log(data.img_url);
					//에디터에 img태그로 저장하기위해 img태그를 만들고 src 속성을 작성해야함
					//var img = $("<img>").attr("src",data.img_url);
					
					//$("#content").summernote("insertNode",img[0]);
					
					$("#content").summernote("editor.insertImage",data.url);
					
					//console.log(data.str);
					
				}).fail(function(err){
					console.log(err);
				});
			}
		</script>
</body>
</html>