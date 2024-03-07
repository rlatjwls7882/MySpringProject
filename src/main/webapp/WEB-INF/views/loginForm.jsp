<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>로그인 페이지</title>
</head>
<body>
<form>
  <div>
    <input type="text" name="id" placeholder="아이디를 입력하세요" />
  </div>
  <div>
    <input type="text" name="pwd" placeholder="비밀번호를 입력하세요" />
  </div>
  <button>로그인</button>
</form>
</body>
</html>