<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <title>회원가입</title>
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

        /* 상자 스타일 */
        .box {
            background-color: #fefefe;
            margin: 15% auto 15% auto; /* 위에서 15%, 아래에서 15% */
            border: 1px solid #888;
            width: 600px;
            height: 400px;
        }
    </style>
</head>
<body>
<script>
    let msgFromController = "${msg}";
    if(msgFromController=="register_failed") alert("회원가입에 실패하였습니다.");
    if(msgFromController=="register_failed_idk") alert("예기치 않은 오류로 회원가입에 실패하였습니다.");
</script>
<form class="box" action="<c:url value='/register'/>" method="post" onsubmit="return formCheck(this)">
    <div class="container">
        <div id="msg"><form:errors/></div>
        <label>
            <b>아이디</b>
            <input type="text" name="id" placeholder="아이디를 입력하세요" />
        </label>
        <label>
            <b>비밀번호</b>
            <input type="password" name="pwd" placeholder="비밀번호를 입력하세요" />
            <input type="password" name="pwdCheck" placeholder="비밀번호를 다시한번 입력하세요" />
        </label>
        <label>
            <b>이름</b>
            <input type="text" name="name" placeholder="이름을 입력하세요" />
        </label>
        <button>회원가입</button>
    </div>
</form>
<script>
    function formCheck(form) {
        if(form.id.value.length<7) {
            setMessage('아이디는 7글자 이상이어야 합니다.', form.id);
            return false;
        }

        let special=false, num=false, alphabet=false;
        for(let i=0;i<form.pwd.value.length;i++) {
            if('0'<=form.pwd.value[i]&&form.pwd.value[i]<='9') {
                num=true
            } else if('a'<=form.pwd.value[i]&&form.pwd.value[i]<='z'||'Z'<=form.pwd.value[i]&&form.pwd.value[i]<='Z') {
                alphabet=true
            } else {
                special=true
            }
            if(num&&alphabet&&special) {
                break;
            }
        }

        if(form.pwd.value.length<3||!special||!num||!alphabet) {
            setMessage('비밀번호는 특수문자, 숫자, 알파벳을 포함한 3글자 이상이어야 합니다.', form.pwd);
            return false;
        }
        if(form.name.value.length<1) {
            setMessage('이름을 입력해주세요.', form.name);
            return false;
        }
        
        // 왜인지 모르겠지만 작동이 안됨
        if(!form.pwd.value.equals(form.pwdCheck.value)) {
            setMessage('두 비밀번호가 일치하지 않습니다.', form.pwdCheck);
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