<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Object obj = request.getAttribute("add_mem");
    	if(obj != null){
    		boolean value = (boolean)obj;
    %>
    	{"res":"<%= value %>"}
    <%		
    	}
    %>
