<%@ page language="java" contentType="text/plain; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	Object obj = request.getAttribute("mem_edit");
    	if(obj != null){
    		boolean value = (boolean) obj;
    %>
    	{"res":"<%= value %>"}
    <%		
    	}
    %>