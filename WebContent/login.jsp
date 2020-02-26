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
	<header id="header">
		<div class="inner">
			<a class="logo" href="control"><strong>LOGO</strong></a>
		</div>
	</header>
	<br/>		
	<!-- 메뉴 -->
	<div>
		<jsp:include page="menu.jsp"/>
	</div>
	<!-- 컨텐츠 영역 -->
	<div class="contents">
		<h1 class="login-title">로그인</h1>
		
		<!-- login-box -->
       	<div class="login-box">
			<div class="person_login">
				<input type="hidden" id="returnURI" value="/">
	            	<table class="login-box-table1">
	                	<caption>개인사용자</caption>
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
						            	<input type="password" name="loginPassword" id="loginPassword" title="비밀번호를 입력하세요." 
						            		placeholder="비밀번호" maxlength="16" onkeydown="if(event.keyCode==13){login.submit();}" autocomplete="off">
						             	<span class="login-check-text non-pb" id="pwdErr" style="display:none;">비밀번호를 입력해주세요.</span>
						         	</div>
						         	<div class="row">
						            	<button class="btn btn-f btn-point login-top" id="login_per" type="button" onclick="login_btn()">Login</button>
						            	<button class="btn btn-f btn-point login-top" id="reg_per" type="button" onclick="Registry()">Registry</button>
						            </div>
								</td>
							</tr>
						</tbody>
				</table>
			</div>
			<div class="group_login">
				<input type="hidden" id="returnURI" value="/">
	            	<table class="login-box-table2">
	                	<caption>기업사용자</caption>
	                       <tbody>
	                       	<tr>
	                        	<td class="login_t">
	                            	<div class="row">
	                                	<input class="input-id" name="loginId" id="loginId" type="text" placeholder="아이디" value="">
										<span class="login-check-text" id="idErr" style="display:none;">아이디를 입력해주세요.</span>
	         						</div>
						         	<div class="row">
						            	<input type="password" name="loginPassword" id="loginPw" placeholder="비밀번호" 
						            		maxlength="16" onkeydown="if(event.keyCode==13){login.submit();}" autocomplete="off">
						             	<span class="login-check-text non-pb" id="pwdErr" style="display:none;">비밀번호를 입력해주세요.</span>
						         	</div>
						         	
						         	<div class="row">
						            	<button class="btn btn-f btn-point login-top" id="login_gro" type="button" onclick="login_btn()">Login</button>
						            	<button class="btn btn-f btn-point login-top" id="reg_gro" type="button" onclick="Registry()">Registry</button>
						            </div>
								</td>
							</tr>
						</tbody>
				</table>
			</div>
		</div>
			
		   <footer> 
			<div class="join">
				<div class="login-foot-menu">
                    <div class="f-right">
                        <a class="go_join" href="#" title="회원가입 페이지로 이동">회원가입</a>
					</div>
				</div>
			</div>
			</footer>
			
	</div>
	<!-- 컨텐츠 영역 끝 -->
</body>
</html>