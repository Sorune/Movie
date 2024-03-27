<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container  pt-6">
    <div class="card o-hidden border-0 shadow-lg my-3">
        <div class="card-body p-2 row justify-content-center">
        	<!-- 셀 형식 -->
        	<div class="row g-5 justify-content-center">
                <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item rounded">
                       <div class="service-img rounded-top">
                            <img src="img/service-1.jpg" class="img-fluid rounded-top w-100" alt="">
                       </div>
                        <div class="service-content rounded-bottom bg-light p-4">
                            <div class="service-content-inner">
                                <h5 class="mb-4">Message Therapy</h5>
                                <p class="mb-4">Dolor, sit amet consectetur adipisicing elit. Soluta inventore cum accusamus, dolor qui ullam</p>
                                <a href="#" class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="service-item rounded">
                       <div class="service-img rounded-top">
                            <img src="img/service-2.jpg" class="img-fluid rounded-top w-100" alt="">
                       </div>
                        <div class="service-content rounded-bottom bg-light p-4">
                            <div class="service-content-inner">
                                <h5 class="mb-4">Physiotherapy</h5>
                                <p class="mb-4">Dolor, sit amet consectetur adipisicing elit. Soluta inventore cum accusamus, dolor qui ullam</p>
                                <a href="#" class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="service-item rounded">
                       <div class="service-img rounded-top">
                            <img src="img/service-3.jpg" class="img-fluid rounded-top w-100" alt="">
                       </div>
                        <div class="service-content rounded-bottom bg-light p-4">
                            <div class="service-content-inner">
                                <h5 class="mb-4">Heat & Cold Therapy</h5>
                                <p class="mb-4">Dolor, sit amet consectetur adipisicing elit. Soluta inventore cum accusamus, dolor qui ullam</p>
                                <a href="#" class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="service-item rounded">
                       <div class="service-img rounded-top">
                            <img src="img/service-4.jpg" class="img-fluid rounded-top w-100" alt="">
                       </div>
                        <div class="service-content rounded-bottom bg-light p-4">
                            <div class="service-content-inner">
                                <h5 class="mb-4">Chiropatic Therapy</h5>
                                <p class="mb-4">Dolor, sit amet consectetur adipisicing elit. Soluta inventore cum accusamus, dolor qui ullam</p>
                                <a href="#" class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="service-item rounded">
                       <div class="service-img rounded-top">
                            <img src="img/service-4.jpg" class="img-fluid rounded-top w-100" alt="">
                       </div>
                        <div class="service-content rounded-bottom bg-light p-4">
                            <div class="service-content-inner">
                                <h5 class="mb-4">Chiropatic Therapy</h5>
                                <p class="mb-4">Dolor, sit amet consectetur adipisicing elit. Soluta inventore cum accusamus, dolor qui ullam</p>
                                <a href="#" class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 테이블 형식 -->
        	<div class="row justify-content-center">
				<table class="table table-striped table-hover text-align-center" id="actorList">
					<thead>
						<tr>
							<th scope="col">#번호</th>
							<th scope="col">배우 이름</th>
							<th scope="col">나이</th>
							<th scope="col"><i class="bi bi-star-fill"></i>평점</th>
							<th scope="col">작성일</th>
							<th scope="col">수정일</th>
							<th scope="col">수정/삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td><img src="" class="bi-person-circle h2 rounded"><span class="px-1">홍길동</span></td>
							<td>19</td>
							<td>3.8</td>
							<td>2024-03-19</td>
							<td>2024-03-19</td>
							<th>
								<div class="row row-cols-2">
									<input type="button" class="btn btn-primary" value="수정">
									<input type="button" class="btn btn-primary" value="삭제">
								</div>
							</th>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td><img src="" class="bi-person-circle h2 rounded"><span class="px-1">홍길순</span></td>
							<td>19</td>
							<td>3.8</td>
							<td>2024-03-19</td>
							<td>2024-03-19</td>
							<th>
								<div class="row row-cols-2">
									<input type="button" class="btn btn-primary" value="수정">
									<input type="button" class="btn btn-primary" value="삭제">
								</div>
							</th>
						</tr>
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