<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<title>Home</title>
	<style>
		/* 검은 배경의 위치 설정 */
		body {
			margin: 0;
			font-family: Arial, Helvetica, sans-serif;
		}

		/* 네비게이션 바 뒤의 검은색 배경 */
		.topnav {
			background-color: #333;
			overflow: hidden;
		}

		/* 네비게이션 바 속의 글자 */
		.topnav a {
			float: left;
			display: block;
			color: white;
			text-align: center;
			padding: 14px 16px;
			text-decoration: none;
			font-size: 17px;
		}

		/* 네비게션바 위에 마우스를 올렸을 때 변경되는 색 */
		.topnav a:hover {
			background-color: #ddd;
			color: black;
		}

		/* 회원가입 버튼 */
		.topnav .register {
			float: right;
		}

		/* 로그인 버튼 */
		.topnav .login {
			float: right;
		}

		/* 아디다스 버튼 */
		.topnav .adidas {
			float: right;
		}
	</style>
</head>
<body>
<script>
	let msg = "${msg}";
	if(msg=="register_success") alert("회원가입에 성공하였습니다.");
</script>
<div class="topnav" id="myTopnav">
	<a href="#btn1">버튼1</a>
	<a href="#btn2">버튼2</a>
	<a href="#btn3">버튼3</a>
	<a href="#adidasBtn" class="adidas" onclick="">
		<i class="fa fa-bars"></i>
	</a>
	<a href="<c:url value='/register'/>" class="register">회원가입</a>
	<a href="<c:url value='/login'/>" class="login">로그인</a>
</div>

<div style="padding-left: 16px">
	<h2>Hello world!</h2>
	<p>현재시간은 ${serverTime} 입니다.</p>
</div>
</body>
</html>