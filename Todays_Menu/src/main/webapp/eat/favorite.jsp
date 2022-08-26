<%@page import="test.eat.dto.EatDto"%>
<%@page import="test.eat.dao.EatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//추천수 올릴 글번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//DB 에서 추천수 올림
	boolean isSuccess=EatDao.getInstance().addFavoriteCount(num);
	EatDto dto=EatDao.getInstance().getData(num);
	int favorite=dto.getFavorite();	
	
%>

