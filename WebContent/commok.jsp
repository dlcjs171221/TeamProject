<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Object obj = request.getAttribute("ans");
    	if(obj != null){
    		boolean value = (boolean)obj;
    %>
    	{"res":"<%= value %>"}
    <%
    	}
    %>