<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<!-- header -->
	<div class="logo_area">
		<a class="logo" href="control">
			<img alt="로그이미지" src="img/B_logo.png" />
		</a>
	</div>
	
	<!-- 메뉴 -->
	<section>
		<jsp:include page="menu.jsp"/>
	</section>
	<!-- 컨텐츠 영역 -->
	<div class="contents">
		<h1 class="login-title">로그인</h1>
		
		<!-- login-box -->
       	<div class="login-box">
			<form action="control?type=login" method="post">
	            <table class="login-box-table1">
                	<caption>개인사용자로그인</caption>
                	<colgroup>
                		<col width="80px" />
                		<col width="*" />
                	</colgroup>
                       <tbody>
                       	<tr>
                        	<td class="login_t">
                            	<div class="row">
                                	<input class="input-id" name="id" id="id" type="text" placeholder="아이디" value="">
									<span class="login-check-text" id="idErr" style="display:none;">아이디를 입력해주세요.</span>
         						</div>
					         	<div class="row">
					            	<input type="password" name="pw" id="pw" placeholder="비밀번호" 
					            		maxlength="16" onkeydown="if(event.keyCode==13){login.submit();}" autocomplete="off">
					             	<span class="login-check-text non-pb" id="pwdErr" style="display:none;">비밀번호를 입력해주세요.</span>
					         	</div>
					         	<div class="row">
					            	<button class="btn btn-f btn-point login-top" id="login_btn" type="button" >Login</button>
					            	<button class="btn btn-f btn-point login-top" id="reg_btn" type="button"
					            		onclick="reg()" >Registry</button>
					            </div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>	
			</div>
			
	</div>
	<!-- 컨텐츠 영역 끝 -->
	
	
	
	
	
	<script src="js/jquery-3.4.1.min.js"></script>
	<script >
	$(function(){
		
		$("#login_btn").bind("click", function(){
			var id = $("#id");
			var pw = $("#pw");
			
			if(id.val().trim().length <= 0){
				alert("아이디를 입력하세요!");
				id.focus();
				return;
			}
			if(pw.val().trim().length <= 0){
				alert("비밀번호를 입력하세요!");
				pw.focus();
				return;
			}
			
			document.forms[0].submit();
		});
		
		
		
		
		
		
	});
	
	
	function reg(){
		location.href="control?type=reg";
	}
	
	</script>
	
	
	
	
	
	
</body>
</html>