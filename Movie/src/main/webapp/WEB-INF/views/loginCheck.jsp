<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<script>
$(document).ready(function(){

	var result = confirm("로그인이 필요합니다. 로그인 하시겠습니까?");
	
	if ( result ){
		location.href = "/login";
	} else {
		history.back();
	}

});
</script>
</body>
</html>