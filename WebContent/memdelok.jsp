<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Object obj = request.getParameter("memdel");
    	if(obj!=null){
    		
    %>
    	{"value":"ok"}
    <%
    	}else{
    %>
    	{"value":"no"}
    <%
    	}
    %>