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
  <title>비밀번호 찾기</title>
  <style>
    body {font-family: Arial, Helvetica, sans-serif;}

    /* input 필드 */
    input[type=text] {
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

    /* 상자 스타일 */
    .box {
      background-color: #fefefe;
      margin: 15% auto 15% auto; /* 위에서 15%, 아래에서 15% */
      border: 1px solid #888;
      width: 600px;
      height: 200px;
    }
  </style>
</head>
<body>
<script>
  let msgFromController = "${msg}";
  if(msgFromController=="search_failed") alert("입력한 아이디가 존재하지 않습니다.");
  else if(msgFromController=="search_success") alert("입력하신 아이디의 비밀번호는 ${pwd}입니다.");
</script>
<form class="box" action="<c:url value='/searchPwd'/>" method="post" onsubmit="return formCheck(this)">
  <div class="container">
    <div id="msg"><form:errors/></div>
    <label>
      <b>아이디</b>
      <input type="text" placeholder="아이디를 입력하세요" name="id">
    </label>
    <button type="submit">비밀번호 찾기</button>
  </div>
</form>
<script>
  function formCheck(form) {
    if(form.id.value.length<1) {
      setMessage('아이디를 입력하세요', form.id)
      return false;
    }
    return true;
  }

  function setMessage(msg, element){
    document.getElementById("msg").style.color = "#db0d36";
    document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;
    element.select();
  }
</script>
</body>
</html>