<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container  pt-6">
    <div class="card o-hidden border-0 shadow-lg my-3">
        <div class="card-body p-2 row justify-content-center">
            <!-- 테이블 형식 -->
        	<div class="row justify-content-center">
				<table class="table table-striped table-hover text-align-center" id="actorList">
					<thead>
						<tr>
							<th scope="col">멤버 번호</th>
							<th scope="col">닉네임</th>
							<th scope="col">전화번호</th>
							<th scope="col">권한</th>
							<th scope="col">수정/삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${members}" var="member" >
							<tr>
								<td data=${member.membno }><img src="" class="bi-person-circle h2 rounded"><span class="px-1">${member.membno }</span></td>
								<td>${ member.nickName }</td>
								<td>${ member.phone }</td>
								<td>${ member.authList[0].auth }</td><!-- List<AuthVO>의 0번항목의 AuthVO객체의 필드 auth 접근 -->
								<td>
									<div class="row row-cols-2">
										<input type="button" class="btn btn-primary" value="수정">
										<input type="button" class="btn btn-primary" value="삭제">
									</div>
								</td>
							</th>
							</tr>
						</c:forEach>
					</tbody>
						
				</table>
        	</div>

			<div class='row'>
				<div class="col-lg-8">
					<form id='searchForm' action="/board/list" method='get'>
						<div class="row row-cols-3">
							<select name='type' class="form-select">
								<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
								<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
								<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
							</select>
							<div class="cols-6">
								<input type='text' class="form-control" name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
								<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
								<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
							</div>
							<button class='btn btn-primary'>검색</button>
						</div>
					</form>
					<div class="col-lg-4">
						<div class="row">
							<div class="col">
							</div>
							<div class="col">
								<a href="/actor/register" class="btn btn-primary">등록하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>