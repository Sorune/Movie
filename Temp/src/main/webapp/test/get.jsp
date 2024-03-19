<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<%@include file="./header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">영화 게시판</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">영화 정보</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

          <div class="form-group">
          <label>번호</label> <input class="form-control" name='bno'
            value='' readonly="readonly">
        </div>

        <div class="form-group">
          <label>제목</label> <input class="form-control" name='title'
            value='' readonly="readonly">
        </div>

        <div class="form-group">
          <label>내용</label>
          <textarea class="form-control" rows="3" name='content'
            readonly="readonly"></textarea>
        </div>
		<div class="form-group">
			<label>출연/제작</label>
			<!-- <ul>
				<li>
				
				
				</li>
			
			</ul> -->
			
		</div>
				<div class="form-group">
			<label>평점</label>
			<textarea class="form-control" rows="1" name='writer'
						readonly="readonly"></textarea>
		</div>
		
		
        <div class="form-group">
          <label>수정일</label> 
          <input class="form-control" name='title'  value='2024-03-19' readonly="readonly">
        </div>
        <div class="form-group">
          <label>등록일</label> 
          <input class="form-control" name='title'  value='2024-03-19'' readonly="readonly">
        </div>
        
        
       

<button data-oper='' class="btn btn-default">게시하기</button>
<button data-oper='modify' class="btn btn-default">Modify</button>
<button data-oper='list' class="btn btn-info">List</button>

<%-- <form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
</form> --%>


<form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
 
</form>



      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/board/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/board/list")
    operForm.submit();
    
  });  
});
</script>


<%@include file="./footer.jsp"%>
