<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //1. get 방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어온다.
   int num=Integer.parseInt(request.getParameter("num"));
   //2. DB 해서 해당 회원의 정보를 삭제한다
   boolean isSuccess=MemberDao.getInstance().delete(num);
   //3. 응답한다.
   
   //컨텍스트 경로
   String cPath=request.getContextPath();

   if(isSuccess){ 
   
      //아래의 경로로 리다일렉트 이동 시킨다. (요청을 다시 하라고 강요)
      //리다일렉트 이동시키는것 자체가 응답이다.
      response.sendRedirect(cPath+"/member/list.jsp");%>
   <%}else{ %>
   <!DOCTYPE html>
   <html>
   <head>
   <meta charset="UTF-8">
   <title>/member/delete.jsp</title>
   </head>
   <body>
      
      <script>
         alert("삭제 실패!");
         location.href="list.jsp";
      </script>
      
   </body>
   </html>
   <%} %>
