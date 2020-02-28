<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% 
    
    Object obj = request.getAttribute("chk"); 
    
    if (obj != null){
    
    	boolean val = (boolean)obj;
    	
%>
	{
		"res": "val"
	}
	
<%
	
   	}
    
%>
	