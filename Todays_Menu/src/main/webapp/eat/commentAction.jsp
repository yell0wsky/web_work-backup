<%@page import="test.cafeC.dto.ComDto"%>
<%@page import="test.cafeC.dao.ComDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File" %>
<% request.setCharacterEncoding("UTF-8");
	ComDto dto=new ComDto();		
	
	int boardnum=1;
	String writer=(String)session.getAttribute("id");
	String content=request.getParameter("commentText");
	
	
	dto.setBoardnum(boardnum);
	dto.setId(writer);
	dto.setContent(content);
	boolean isSuccess=ComDao.getInstance().insert(dto);
%>