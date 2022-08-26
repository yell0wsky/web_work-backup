<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 메뉴</title>
<jsp:include page="/comp/font.jsp"></jsp:include>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/comp/navbar.jsp"></jsp:include>
<h1 class="text-center mt-4 mb-4">게시판을 선택하세요</h1>
<div class="container text-center bg-light" style="background-color:#F8F9FA">
  <div class="row mb-4">
    <div class="col">
    	<a href="${pageContext.request.contextPath }/eat/list.jsp">
    	<p>맛집추천</p>
    	<img src="${pageContext.request.contextPath }/images/eat.jpg" height="400px" width="400px"/>
    	</a>
    </div>
    <div class="col">
        <a href="${pageContext.request.contextPath }/movie/list.jsp">
        <p>영화추천</p>
        <img src="${pageContext.request.contextPath }/images/movie.png" height="400px" width="400px"/>
    	</a>
    </div>
    <div class="col">
      짤방추천
    </div>
  </div>
  <div class="row">
<div class="col">
	<a href="${pageContext.request.contextPath }/notice.jsp">
	<p>공지사항</p>
	<img src="${pageContext.request.contextPath }/images/notice.jpg" height="400px" width="400px"/>
	</a></div>
<div class="col">
<p>방명록</p>
</div>
</div>
</div>
<jsp:include page="/comp/footer.jsp"></jsp:include>
</body>
</html>