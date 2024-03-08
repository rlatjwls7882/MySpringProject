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
  <title>로그인 페이지</title>
</head>
<body>
<script>
  let messageFromController = "${msg}";
  if(messageFromController=="login_failed") alert("아이디 또는 비밀번호가 일치하지 않습니다.");
  if(messageFromController=="login_failed_idk") alert("예기치 않은 오류로 로그인에 실패하였습니다.");
</script>
<form action="<c:url value="/login"/>" method="post" onsubmit="return formCheck(this)">
  <div id="msg"><form:errors/></div>
  <div>
    <input type="text" name="id" placeholder="아이디를 입력하세요" />
  </div>
  <div>
    <input type="password" name="pwd" placeholder="비밀번호를 입력하세요" />
  </div>
  <button>로그인</button>
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