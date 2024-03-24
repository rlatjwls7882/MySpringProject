<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  <title>로그인</title>
  <style>
    body {font-family: Arial, Helvetica, sans-serif;}

    /* input 필드 */
    input[type=text], input[type=password] {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }

    /* 버튼 스타일 */
    button {
      background-color: #333;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      cursor: pointer;
      width: 100%;
    }

    button:hover {
      opacity: 0.8;
    }

    .container {
      padding: 16px;
    }

    .bottom {
      float: right;
    }

    .bottom a {
      text-decoration-line: none;
      color: #5e5a5a;
    }

    /* 상자 스타일 */
    .box {
      background-color: #fefefe;
      margin: 15% auto 15% auto; /* 위에서 15%, 아래에서 15% */
      border: 1px solid #888;
      width: 600px;
      height: 300px;
    }
  </style>
</head>
<body>
<script>
  let messageFromController = "${msg}";
  if(messageFromController=="login_failed") alert("아이디 또는 비밀번호가 일치하지 않습니다.");
  if(messageFromController=="login_failed_idk") alert("예기치 않은 오류로 로그인에 실패하였습니다.");
</script>
<form class="box" action="<c:url value="/login"/>" method="post" onsubmit="return formCheck(this)">
  <div class="container">
    <div id="msg"><form:errors/></div>
    <label>
      <b>아이디</b>
      <input type="text" placeholder="아이디를 입력하세요" name="id" value="${cookie.id.value}">
    </label>
    <label>
      <b>비밀번호</b>
      <input type="password" placeholder="비밀번호를 입력하세요" name="pwd">
    </label>
    <button type="submit">로그인</button>
    <label>
      <input type="checkbox" name="rememberId" ${empty cookie.id.value?"":"checked"}> 아이디 기억하기
    </label>
    <div class="bottom">
      <a href="#" class="searchId">아이디 찾기</a>
      <a href="#" class="searchPwd">비밀번호 찾기</a>
      <a href="<c:url value='/register'/>" class="register">회원가입</a>
    </div>
  </div>
</form>
<script>
  function formCheck(form) {
    if(form.id.value.length<1) {
      setMessage('아이디를 입력하세요', form.id)
      return false;
    }
    if(form.pwd.value.length<1) {
      setMessage('비밀번호를 입력하세요', form.pwd)
      return false;
    }
    return true;
  }

  function setMessage(msg, element){
    document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;
    element.select();
  }
</script>
</body>
</html>