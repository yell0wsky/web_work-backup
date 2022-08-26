<%@page import="test.eat.dao.EatDao"%>
<%@page import="test.eat.dto.EatDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%
//GET 방식 파라미터로 전달되는 글 번호를 읽어온다. 
	int num=Integer.parseInt(request.getParameter("num"));
	//글 번호를 이용해서 글 하나의 정보를 읽어온다. 
	EatDto dto=EatDao.getInstance().getData(num);
	//로그인된 아이디
	String id=(String)session.getAttribute("id");
	//조회수 올리기
	EatDao.getInstance().addViewCount(num);
	String favorite=request.getParameter("favorite");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<jsp:include page="/comp/font.jsp">
<jsp:param value="eat" name="thisPage" />
</jsp:include>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/js/gura_util.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	img{
		max-width: 100%;
	}
</style>
</head>
<body>
<jsp:include page="/comp/navbar.jsp"></jsp:include>
<div class="container">
	<h1>글 상세 보기</h1>
	<table class="table table-bordered">
		<colgroup>
			<col class="col-6"/>
			<col class="col-6"/>
		</colgroup>
		<tr>
			<th>글번호</th>
			<td><%=dto.getNum() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=dto.getViewCount() %></td>
		</tr>
		<tr>
			<th>좋아요</th>
			<td id="favorite"><%=dto.getFavorite() %></td>
		</tr>
		<tr>
			<td colspan="2">
				<div><%=dto.getContent() %></div>
			</td>
		</tr>
	</table>
	<div class="container">
	<div class="form-group">
		<form id="commentForm" method="post" action="commentAction.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<td style="border-bottom:none;" valign="middle"></td>
					<td><input id="comment" type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
					<td><br><br><button type="submit" class="btn btn-outline-primary">댓글 작성</button>
				</tr>
			</table>
		</form>
	</div>
	</div>
	<div>
	<a href="javascript:" onclick="addFavoriteCount()"><button class="btn btn-success">좋아요</button></a>
	<a href="list.jsp"><button class="btn btn-secondary">목록</button></a>
	<%-- 만일 글 작성자가 로그인된 아이디와 같다면 수정, 삭제 링크를 제공한다. --%>
	<%if(dto.getWriter().equals(id)){ %>
		<a href="private/updateform.jsp?num=<%=dto.getNum()%>"><button class="btn btn-primary">수정</button></a>
		<a href="javascript:" onclick="deleteConfirm()"><button class="btn btn-danger">삭제</button></a>

	<%} %>
	</div>
</div>
<script>
	function deleteConfirm(){
		const isDelete=confirm("이 글을 삭제 하겠습니까?");
		if(isDelete){
			location.href="private/delete.jsp?num=<%=dto.getNum()%>";
		}
	}
	
	function addFavoriteCount(){
		const isFavorite=confirm("이 글에 좋아요를 하시겠습니까?");
		if(isFavorite){
			ajaxPromise("favorite.jsp", "get", "num=<%=dto.getNum()%>")
			.then((res)=>{
				return res.json();
			})
			.then((data)=>{
				console.log(data);
			});
			document.getElementById("favorite").value=<%=favorite%>;
			
		};
	};
	
	document.querySelector("#commentForm").addEventListener("submit", (e)=>{
		//폼 전송 막기 
		e.preventDefault();
		const isComment=confirm("댓글을 작성하시렵니까?");
		const form=document.querySelector("#commentForm");
		if(isComment){
			ajaxFormPromise(form)
			.then((res)=>{
				return res.json();
			})
			.then((data)=>{
				console.log(data);
			});
			document.getElementById("comment").value='';
		};	
	});
</script>
</body>	
</html>