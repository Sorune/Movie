<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<style>
	.red {
		border: 1px solid red;
	}
	.top-block{
	height:148px;
	}
	.color00b0f0{
		color:#00b0f0;
	}
	.float-right{
		float:right;
	}
	.img-small{/* 임시  */
		width:50px;
		height:auto;
	}
</style>


<div class="container ">
	<div class="top-block"><!-- 상단 안보이는걸 막기위한 div 미디어쿼리 넣어야한다.--></div>
	
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">영화 게시판</h2>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-lg-12">
			<div class="">
				<div class=" color00b0f0">
					<h4 class="color00b0f0">영화 목록</h4>
					<button type="button" class="float-right">
						영화 추가</button>
				</div>

				<!-- /.panel-heading -->
				<div >
					<table class="table table-striped table-bordered table-hover" >
						<thead class="">
							<tr>
								<th>#번호</th>
								<th>이미지</th>
								<th>제목</th>
								<th>출연/제작자</th>
								<th>개봉일</th>
								<th><i class="bi bi-star-fill"></i>평점</th>
								<th>수정일</th>
								<th>작성일</th>
							</tr>
						</thead>
							<tr>
								<td>1</td>
								<td><img src="../resources/img/dune-1.jpg" alt="My Image" class="img-small"></td>
								<td>제목테스트</td>
								<td>출연테스트</td>
								<td>2024-03-19</td>
								<td>3.8</td>
								<td>2024-03-19</td>
								<td>2024-03-19</td>
							</tr>
							<tr>
								<td>2</td>
								<td><img src="../resources/img/dune-1.jpg" alt="My Image" class="img-small"></td>
								<td>제목테스트</td>
								<td>출연테스트</td>
								<td>2024-03-19</td>
								<td>3.8</td>
								<td>2024-03-19</td>
								<td>2024-03-19</td>
							</tr>
							
					</table>

					<div class='row'>
						<div class="col-lg-12">

							<form id='searchForm' action="/board/list" method='get'>
								<select name='type'>
									<option value=""
										<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
									<option value="T"
										<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
									<option value="C"
										<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
									<option value="W"
										<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
									<option value="TC"
										<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
										or 내용</option>
									<option value="TW"
										<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
										or 작성자</option>
									<option value="TWC"
										<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
										or 내용 or 작성자</option>
								</select> <input type='text' name='keyword'
									value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
									type='hidden' name='pageNum'
									value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
									type='hidden' name='amount'
									value='<c:out value="${pageMaker.cri.amount}"/>' />
								<button class='btn btn-default'>검색</button>
							</form>
						</div>
					</div>


					<div class='pull-right'>
						<ul class="pagination">

							<%--             <c:if test="${pageMaker.prev}">
              <li class="paginate_button previous"><a href="#">Previous</a>
              </li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}"
              end="${pageMaker.endPage}">
              <li class="paginate_button"><a href="#">${num}</a></li>
            </c:forEach>

            <c:if test="${pageMaker.next}">
              <li class="paginate_button next"><a href="#">Next</a></li>
            </c:if> --%>

							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous"><a
									href="${pageMaker.startPage -1}">Previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
									<a href="${num}">${num}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="paginate_button next"><a
									href="${pageMaker.endPage +1 }">Next</a></li>
							</c:if>


						</ul>
					</div>
					<!--  end Pagination -->
				</div>

				<form id='actionForm' action="/board/list" method='get'>
					<input type='hidden' name='pageNum'
						value='${pageMaker.cri.pageNum}'> <input type='hidden'
						name='amount' value='${pageMaker.cri.amount}'> <input
						type='hidden' name='type'
						value='<c:out value="${ pageMaker.cri.type }"/>'> <input
						type='hidden' name='keyword'
						value='<c:out value="${ pageMaker.cri.keyword }"/>'>


				</form>


				<!-- Modal  추가 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Save changes</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->


			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>
</div>
<!-- /.row -->

</div>

<%@ include file="/common/footer.jsp" %>