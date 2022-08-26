<%@page import="org.json.JSONWriter"%>
<%@page import="test.eat.dao.EatDao"%>
<%@page import="test.eat.dto.EatDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//글목록 얻어오기
	List<EatDto> list=EatDao.getInstance().getList();
	//JSON 문자열로 변환하기 
	String result=JSONWriter.valueToString(list);
%>
<%-- JSON 문자열을 그대로 client 에게 출력하기  --%>
<%=result%>