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
    <title>회원가입 페이지</title>
</head>
<body>
<script>
    let msgFromController = "${msg}";
    if(msgFromController=="register_failed") alert("회원가입에 실패하였습니다.");
    if(msgFromController=="register_failed_idk") alert("예기치 않은 오류로 회원가입에 실패하였습니다.");
</script>
<form action="<c:url value='/register'/>" method="post" onsubmit="return formCheck(this)">
    <div id="msg"><form:errors/></div>
    <div>
      <input type="text" name="id" placeholder="아이디를 입력하세요" />
    </div>
    <div>
      <input type="password" name="pwd" placeholder="비밀번호를 입력하세요" />
    </div>
    <div>
      <input type="text" name="name" placeholder="이름을 입력하세요" />
    </div>
    <button>회원가입</button>
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
            setMessage('이름은 1글자 이상이어야 합니다.', form.name);
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