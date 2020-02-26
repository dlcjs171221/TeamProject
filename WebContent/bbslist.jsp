<%@page import="bbs.util.paging"%>
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
	<div class="b_contents">
		<h3>자료실</h3>
		<table id="list">
			<colgroup>
				<col width="50px"/>
				<col width="200px"/>
				<col width="200px"/>
				<col width="110px"/>
				<col width="40px"/>
			</colgroup>
			<thead>
			<tr>
				<th>NO.</th>
				<th>title</th>
				<th>writer</th>
				<th>date</th>
				<th>hit</th>
			</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td><a href="">2</a></td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
				</tr>
			</tbody>
			<tfoot>
                      <tr>
                          <td colspan="5">
                              <ol class="paging">
                                  
               <%
               		Object obj = request.getAttribute("page");
               		paging pvo = null;
               		if(obj != null){
               			pvo = (paging)obj;
               			
               	 	if(pvo.getStartPage() < pvo.getPagePerBlock()){
               %>
               		<li class="disable">&lt;</li>
               <%	
               	 	}else{
               %>
               		<li><a href="control?type=list&cPage=<%= pvo.getNowPage()-pvo.getPagePerBlock() %>">&lt;</a></li>
               <%	 		
               	 	}
               	 	
               	 	for(int i=pvo.getStartPage(); i<=pvo.getEndPage(); i++){
               	 	if(pvo.getNowPage() == i){
               	%>
               	 		
               	 	<li class="now"><%= i %></li>
               	<%
               	 	}else{
				%>
					<li><a href="control?type=list&cPage=<%=i%>"><%= i %></a></li>
				<%
               	 		}
               	 	}
               	 	
               		if(pvo.getEndPage()< pvo.getTotalPage()){	
               %>
					<li><a href="control?type=list&cPage=<%= pvo.getNowPage()+pvo.getPagePerBlock() %>">&gt;</a></li>
				<%
               		}else{
				%>
					<li class="disable">&gt;</li>
				<%
               		}
               		}
				%>
				
                              </ol>
                          </td>
						 
                      </tr>
                  </tfoot>
		</table>
		<a href="" id="write" class="btn btn-primary">글쓰기</a>
	</div>
	<br/><br/>
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
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>