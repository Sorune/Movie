<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>

 div, textarea, input{
 width:100%;
 
 }
.red{
	border: 1px solid red;
	
}
.border_none{
	border:none;
}
.flex_center{
	display : flex;
	justify-content : center;
	align-items : center;
	text-align:center;
}
.flex{
	display : flex;
}
.top-block{
	height: 174px;
	}
.noti .title_area{
	background-color: #eaeaea;
	display : flex;
	justify-content : center;
	align-items : center;
	width:85px;
}
.noti .option_area{
	display:flex;
}

.noti .group_area{
	display:flex;
	width:100%;
	min-height:46px;
}

.noti .upload_area{
	width:100%;
}
.noti .file_upload{
	text-align:center;
	height:60px;
}
.noti .file_upload button{
	margin-top:7px;
}
 .noti .option_area{
padding: 10px 10px 0 10px;
}
</style>


<div class="container noti">
	<!-- 바디영역 : 컨테이너 -->
	<div class="top-block">
		<!-- header에 가지리않기 위한 블록 -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">공지 사항 (#<c:out value="${notice.bno}"/>)</h2>
		</div>
		<!-- end col-lg-12 -->
	</div>
	<div class="row">
		
			<div class="col-lg-12 ">


			<div class="border">

				<div class="group_area ">
					<div class="title_area border-bottom">
						<label>제목</label>
					</div>
					<div class="option_area border-bottom">
						
						<input class="border_none"  name='title' value='<c:out value="${notice.title}"/>' readonly="readonly">

					</div>
				</div>
				<div class="group_area ">
					<div class="title_area border-bottom">
						<label>글쓴이</label>
					</div>
					<div class="option_area border-bottom">
						<input class="border_none"  name='title' value='<c:out value="${notice.writer}"/>' readonly="readonly">
					</div>
				</div>
				<div class="group_area border-bottom">
					<div class="title_area">
						<label>첨부파일</label>
					</div>
					<div class="option_area">

					</div>
				</div>

				<div class="group_area content">
					<div class="title_area">
						<label>내용</label>
					</div>
					<div class="option_area">
						<textarea class="border_none" rows="8" name='content' readonly="readonly"><c:out value="${notice.content}"/></textarea>
					</div>


				</div>
			</div>

		<button data-oper='modify' class="border btn btn-default"
			onclick="location.href='/notice/modify?bno=<c:out value="${notice.bno}"/>'">수정하기</button>
			<button data-oper='list' class="border btn btn-info"
				onclick="location.href='/notice/list'">뒤로가기</button> 
		
		<!-- <button data-oper='modify' class="border btn btn-default">등록하기</button>
		<button data-oper='list' class="border btn btn-info">뒤로가기</button> -->
		

		<form id='operForm' action="/notice/modify" method="get">
			<input type="hidden" name="${_csrf.parameterName}" value = "${_csrf.token}"/>
			<input type='hidden' id='bno' name='bno' value='<c:out value="${notice.bno}"/>'>
			<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
			<!-- 웹상에서 뒤로가기 버튼누를경우 Criteria 파라미터도 추가해서 전달해준다. -->
			
		
		</form>
		
		
		
		</div>	

	</div>
	<!-- end row -->
	
</div>
<!-- 콘테이너 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jquery footer에 넣어져있는저 적용안된다 이유는 모름 -->
<script type="text/javascript">

var bnoValue = '<c:out value="${notice.bno}"/>';


$(document).ready(function(){
	
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action", "/notice/modify").submit();
	});
	  
	$("button[data-oper='list']").on("click", function(e){
		    
		operForm.find("#bno").remove();
		operForm.attr("action","/notice/list")
		operForm.submit();
		    
	});  
	
});


</script>





<%@ include file="/WEB-INF/views/common/footer.jsp" %>