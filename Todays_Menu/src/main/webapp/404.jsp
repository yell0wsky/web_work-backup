<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url(https://fonts.googleapis.com/css?family=Press+Start+2P);

body {
	margin: 0;
	background: #000 url('http://stixdev.com/images/404-2.png') center
		no-repeat;
	height: 855px;
	text-transform: uppercase;
}

h1, h2, h3 {
	font-family: 'Press Start 2P', cursive;
	margin: 0 auto 0 auto;
	text-align: left;
	position: relative;
	text-shadow: 3px 3px 0px #2038ec;
	color: #fff;
	font-weight: 400;
}

h1 {
	font-size: 1.7em;
	width: 260px;
	top: 148px;
	line-height: 60px;
	padding-left: 292px;
}

h2 {
	top: 26px;
	width: 150px;
	font-size: 1.6em;
	z-index: 1;
}

h2 a {
	color: #fff;
	text-decoration: none;
	margin-left: 375px;
	width: 200px;
}

h2 a:hover {
	text-shadow: 3px 3px 0px #d82800;
}

h3 {
	width: 400px;
	padding-right: 300px;
	font-size: 1.5em;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
</head>
<body>
	<h2>
		<a href="#">Stix</a>
	</h2>
	<h3>Page not found</h3>
	<h1></h1>
	<script>
		var showText = function(target, message, index, interval) {
			if (index < message.length) {
				$(target).append(message[index++]);
				setTimeout(function() {
					showText(target, message, index, interval);
				}, interval);
			}
		}
		$(function() {
			showText("h1", "I am error 404.", 0, 80);
		});
	</script>
</body>
</html>