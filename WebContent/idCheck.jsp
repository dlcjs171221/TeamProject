<%@page import="mybatis.dao.MemDAO"%>
<%@page import="mybatis.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemVO vo = null;
	Object obj = request.getAttribute("vo_id");
	if(obj != null){	
		
%>
	<pre id="chk" class="success">사용불가</pre>
<%		
	}else{
%>
	
	<pre id="chk" class="fail">사용가능</pre>
<%		
	}
%>    
