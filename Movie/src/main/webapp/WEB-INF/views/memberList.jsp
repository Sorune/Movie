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
							<th scope="col">관리자</th>
							<th scope="col">수정/삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${members}" var="member">
					        <c:choose>
					            <c:when test="${member.authList[0].auth eq 'ROLE_ADMIN'}">
					                <!-- Skip rendering for ROLE_ADMIN -->
					            </c:when>
					            <c:otherwise>
					                <tr>
					                    <td data=${member.membno} class="text-align-center"><span class="px-1">${member.membno}</span></td>
					                    <td class="text-align-center"><img src="" class="bi-person-circle h2 rounded"><span class="px-1">${member.nickName}</span></td>
					                    <td class="text-align-center">${member.phone}</td>
					                    <c:choose>
							                <c:when test="${member.authList[0].auth eq 'ROLE_MEMBER'}">
							                    <td class="text-align-center"><input type="checkbox" name="role" value="${member.authList[0].auth}" onclick="isChecked(this)" /></td>
							                </c:when>
							                <c:when test="${member.authList[0].auth eq 'ROLE_MANAGER'}">
							                    <td class="text-align-center" ><input type="checkbox" name="role" value="${member.authList[0].auth}" onclick="isChecked(this)" checked/></td>
							                </c:when>
							                <c:otherwise>
							                </c:otherwise>
							            </c:choose>
					                    <td class="text-align-center">
					                        <div class="row row-cols-2">
					                            <button id="modify" class="btn btn-primary">수정</button>
					                            <button id="remove" class="btn btn-primary" value="${member.membno}">삭제</button><!-- console.log(e.target.value); -->
					                        </div>
					                    </td>
					                </tr>
					            </c:otherwise>
					        </c:choose>
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