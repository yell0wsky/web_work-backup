<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--
	navbar.jsp 페이지를 include 하고
	"thisPage"라는 파라미터 명으로 file
 --%>

	<nav class="navbar navbar-light bg-light navbar-expand-lg">
		<div class="container-fluid mp-2 mp-2">
		    <a class="navbar-brand" href="${pageContext.request.contextPath}/">
		      	<img src="${pageContext.request.contextPath}/images/todaysmenu.png" alt="" width="30" height="30" class="d-inline-block">
		      	오늘의 메뉴
		    </a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
		    	data-bs-target="#navbarNav">
   				<span class="navbar-toggler-icon"></span>
    		</button>
    		<div class="collapse navbar-collapse" id="navbarNav">
      			<ul class="navbar-nav me-auto">
      				<li class="nav-item">
	          			<a class="nav-link active" ${param.thisPage eq 'eat'?'active':''} href="${pageContext.request.contextPath}/eat/list.jsp">맛집추천</a>
	        		</li>
      				<li class="nav-item">
	          			<a class="nav-link ${param.thisPage eq 'movie' ? 'active' : '' }" href="${pageContext.request.contextPath}/movie/list.jsp">영화추천</a>
	        		</li>	        		
	     			<li class="nav-item">
	          			<a class="nav-link ${param.thisPage eq 'gallery' ? 'active' : '' }" href="${pageContext.request.contextPath}/gallery/list.jsp">짤방추천</a>
	        		</li>
      			</ul>
      			<c:choose>
      				<c:when test="${empty id }">
	      				<a class="btn btn-outline-primary btn-sm me-2" href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입</a>
	      				<a class="btn btn-outline-success btn-sm me-2" href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
      				</c:when>
      				<c:otherwise>
	      				<span class="navbar-text me-2">
	      					<a href="${pageContext.request.contextPath}/users/private/info.jsp">${id }</a>님이 로그인 중입니다...
	      				</span>
	      				<a class="btn btn-outline-danger btn-sm me-2" href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
      				</c:otherwise>
      			</c:choose>
    		</div>
		</div>
	</nav>