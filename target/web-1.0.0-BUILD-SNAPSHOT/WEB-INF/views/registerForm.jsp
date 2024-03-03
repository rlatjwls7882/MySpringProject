<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>회원가입 페이지</title>
</head>
<body>
<form action="<c:url value='/register'/>" method="post">
    <div>
      <input class="id" type="text" name="id" placeholder="아이디를 입력하세요" />
    </div>
    <div>
      <input class="pwd" type="text" name="pwd" placeholder="비밀번호를 입력하세요" />
    </div>
    <div>
      <input class="name" type="text" name="name" placeholder="이름을 입력하세요" />
    </div>
    <button>회원가입</button>
</form>
</body>
</html>