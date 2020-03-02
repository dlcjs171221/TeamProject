<%@page import="java.util.List"%>
<%@page import="mybatis.vo.WcommVO"%>
<%@page import="mybatis.dao.WbsDAO"%>
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
	#comm_body{
		margin-left: 250px;
		width: 1000px;
		padding-left: 100px;
	}
	#comm_ans{
		margin-left: 250px;
		border: 1px solid black;
		width: 600px;
	}
	#comm{
		display: none;
	}
	#ans_del{
		display: none;
	}
	#cans{
		border: 1px solid black;
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
		<%
				String nowPage = request.getParameter("cPage");
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
	
			<tfoot>
				<tr>
					<td colspan="4">
						<button type="button" id="edit"  class="btn btn-info">Edit</button>
						<button type="button" id="del"   class="btn btn-warning">Delete</button>
						<button type="button" id="list" onclick="goList()" class="btn btn-danger">List</button>
						<button type="button" id="ans" class="btn btn-danger">댓글</button>
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
	</div>
	<div id="comm">
		<table>
		
			<tbody id="comm_body">
				
				<tr>
					<th><h3><label for="writer">작성자:</label> </h3></th>
					<td><input type="text" id="writer" name="writer"size="20"> </td>
				</tr>
				<tr>
					<th><h3><label for="content">내용:</label> </h3></th>
					<td><textarea rows="6" cols="20" id="add_content" name="add_content"></textarea> </td>
				</tr>
				<tr>
					<th><h3><label for="pwd">PW:</label> </h3> </th>
					<td><input type="password" id="pwd" name="pwd" size="20"> </td>
				</tr>
				<tr>
					<td><button type="button" id="comm_ok" name="comm_ok" class="btn btn-info">작성</button></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<table id="comm_ans">
	<%
		List<WcommVO> list = vo.getC_list();
		int c =0;
		for(WcommVO cvo:list){
	%>
		<tbody id="cans">
			<tr>
				<td><input type="hidden" id="c_idx" value="<%=cvo.getC_idx()%>"> </td>
			</tr>
			<tr>
					<th><h3> <label>작성자:</label></h3> </th>
					<td><%= cvo.getWriter() %></td>
				</tr>
				<tr>
					<th><h3><label>내용:</label> </h3></th>
					<td><%= cvo.getContent() %></td>
				</tr>
				<tr>
				<td><button type="button" id="comm_del" name="comm_del" class="btn btn-info">삭제</button></td>
				</tr>
		<%
			c++;
		}
		%>
				
					
				
		</tbody>
	</table>
	<hr/><hr/>
	<%
		
		}// if문 끝
		
	%>
	
	<form name="frm" method="post">
		<input type="hidden" name="type"/>
		<input type="hidden" name="f_name"/>
		<input type="hidden" name="b_idx" value="${param.b_idx}"/>
		<input type="hidden" id="cPage" name="cPage" value="${param.cPage}"/>
	</form>
	
	<div id="del_win">
		<form>
			<label for="password">비밀번호:</label>
			<input type="password" id="d_pw" name="d_pw"/><br/><br/>
			<button type="button" id="d_btn" name="d_btn" class="btn btn-warning">삭제</button>
			<button type="button" id="d_close" name="d_close" class="btn btn-warning">닫기</button><br/><br/>
		</form>
	</div>
	<div id="ans_del">
		<form>
			<label for="password">비밀번호:</label>
			<input type="password" id="c_pw" name="c_pw"/><br/><br/>
			<button type="button" id="c_btn" name="c_btn" class="btn btn-warning">삭제</button>
			<button type="button" id="c_close" name="c_close" class="btn btn-warning">닫기</button><br/><br/>
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

		<script src="js/jquery-3.4.1.min.js"></script>
		<script src="js/jquery-ui.min.js"></script>
		<script src="js/summernote-lite.js"></script>
		<script src="js/lang/summernote-ko-KR.min.js"></script>
		<script type="text/javascript">
		
		
		function goList(){
			document.frm.type.value= "list";
			document.frm.submit();
			
			
		}
		
		function edit() {
			
			
		}
		
			$(function(){
				$("#del").bind("click",function(){
					$("#del_win").css("display", "block");
					$("#del_win").dialog();
					$("#del_win").dialog("option","width",300);
				});
				
				$("#d_btn").bind("click", function(){
					$("#del_win").dialog("close");
				});
				
				$("#d_btn").bind("click", function(){
					var b_idx = $("#b_idx").val();
					var pw = $("#pw").val();
					var cPage = $("#cPage").val();
					
					var param = "type=del&b_idx="+encodeURIComponent(b_idx)+
						"&pw="+encodeURIComponent(pw);
					
					$.ajax({
						url : "control", //보낼 주소
						type : "post",  // 파라미터를 보내는 방식
						data : param, //보내고자 하는 파라미터
						dataType : "json" //요청하고 받을 데이터타입
					}).done(function(data){
						if(data.res == "true"){
							alert("정말 삭제하시겠습니까?")
							//에이잭스는 갔다가 돌아 오므로 다시 list로 갈때
							//cPage값을 주면 된다.
							location.href="control?type=flist&cPage=${param.cPage}";
							
						}else{
							alert("비밀번호가 다릅니다");
						}
					}).fail(function(err){
						console.log(err);
					});
				
				
				$("#d_close").bind("click",function(){
					$("#del_win").dialog("close");
				});
				
				$("#ans").bind("click",function(){
					$("#comm").dialog();
					$("#comm").dialog("option","width",450);
				});
				$("#comm_ok").bind("click",function(){
					var writer = $("#writer").val();
					var content = $("#add_content").val();
					var pwd = $("#pwd").val();
					
					param = "type=commans&writer="+encodeURIComponent(writer)+"&content="+encodeURIComponent(content)+"&pwd="+encodeURIComponent(pwd)+"&b_idx="+<%=b_idx%>+"&cPage="+<%=nowPage%>;
					
					if(writer.trim().length<1){
						alert("작성자를 입력하세요");
						return;
					}
					if(content.trim().length<1){
						alert("내용을입력하세요");
						return;
					}
					$.ajax({
						url:"control",
						type: "post",
						dataType:"json",
						data: param
					}).done(function(data){
						if(data.res=="true"){
							alert("작성완료");
							location.href="control?type=fview&cPage="+<%=nowPage%>+"&b_idx="+<%=b_idx%>;
						}
					}).fail(function(err){
						
					});
					
				});
				$("#comm_del").bind("click",function(){
					$("#ans_del").dialog();
					$("#ans_del").dialog("option","width",300);
					
				});
				
				$("#c_btn").bind("click",function(){
					var pw = $("#c_pw").val();
					var c_idx = $("#c_idx").val();
					var pwd = $("#pwd").val();
					param = "type=ans&pw="+encodeURIComponent(pw)+"&c_idx="+encodeURIComponent(c_idx);
					
					$.ajax({
						url:"control",
						type: "post",
						dataType: "json",
						data: param
					}).done(function(data){
						if(data.res =="true"){
							alert("삭제완료");
							location.href="control?type=fview&cPage="+<%=nowPage%>+"&b_idx="+<%=b_idx%>;
						}
					}).fail(function(err){
						
					});
				});
				$("#c_close").bind("click",function(){
					$("#ans_del").dialog("close");
				});
				
				$("#d_btn").bind("click",function(){
					var b_idx = $("#b_idx").val();
					var pw = $("#d_pw").val();
					var nowPage = $("#cPage").val();
					
					var d_pw = $("#d_pw").val();
					
					
					if(d_pw == pw ){
						var chk = confirm("삭제하시겠습니까???");
						
						if(chk == true){
						
							location.href="control?type=fdel&cPage="+cPage+"&b_idx="+b_idx+"&pw="+pw;
							//type = fdel 로 property추가
							
						}
					}
				});
				
			});
			
			$("#edit").bind("click", function(){
				console.log("aaaaa");
				document.frm.action = "control?type=fedit";
				document.frm.submit();
			});
			
			
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