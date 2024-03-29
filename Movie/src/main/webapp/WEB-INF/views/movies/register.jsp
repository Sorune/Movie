<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="container  pt-6">
    <div class="card o-hidden border-0 shadow-lg my-3">
        <div class="card-body p-2">
			<div class="row justify-content-center">
				<div class="row justify-content-center">
					<div class="col-lg-12">
						<h4 class="color00b0f0">영화정보입력</h4>
						<div class="row justify-content-center">
							<input type="file" name="imgList" id="file-input" accept="image/*" style="display: none;" multiple>
							<form role="form" action="/register/new" method="post">
								<div class="row justify-content-center">
									<input type="hidden" name="${_csrf.parameterName}" value = "${_csrf.token}"/>
									<div class="col-4">
										<div id="uploadedImages" class="carousel slide carousel-fade" data-bs-ride="carousel">
							        		<div class="carousel-inner" style="width:100%;height:auto;">
												<div id="drop-area" style="width:100%;">
													<p>이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.</p>
									        	</div>
							        		</div>
							        		<button class="carousel-control-prev" type="button" data-bs-target="#uploadedImages" data-bs-slide="prev">
												<span class="carousel-control-prev-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Previous</span>
											</button>
											<button class="carousel-control-next" type="button" data-bs-target="#uploadedImages" data-bs-slide="next">
												<span class="carousel-control-next-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Next</span>
											</button>
											<button type="button" class="carousel-control-add" id="uploadImage" data-bs-target="#uploadedImages">
												<span class="bi bi-file-plus fz20" aria-hidden="true"></span>
												<span class="visually-hidden">Add</span>
											</button>
											<button type="button" class="carousel-control-remove" id="deleteImage" data-bs-target="#uploadedImages">
												<span class="bi bi-file-x fz20" aria-hidden="true"></span>
												<span class="visually-hidden">Remove</span>
											</button>
							        	</div>
							        </div>
							        <div class="col-8">
						        		<div class="form-group">
								        	<div class="row">
													<label>제목</label><input class="form-control" name='title'>
											</div>
											<div class="row d-flex align-items-center">
												<div class="row d-flex align-items-center">
													<div class="col-4">
														<label>개봉일</label>
													</div>
													<div class="col-4">
														<label>시청자의 권장 연령 등급</label>
													</div>
													<div class="col-4">
														<label>쿠키 유무</label>
													</div>
												</div>
												<div class="row d-flex align-items-center">
													<div class="col-4">
														<div class="form-group">
															<input type="date" name="createdDate" class="form-control" id="date" max="2024-03-20" min="1850-06-05" value="" />
														</div>
													</div>
													<div class="col-4">
														<div class="form-group">
															<select class="form-select">
																<option value="all">전체 이용가</option>
																<option value="7">7세 이상 시청가</option>
																<option value="12">12세 이상 시청가</option>
																<option value="15">15세 이상 시청가</option>
																<option value="19">19세 이상 시청가</option>
															</select>
														</div>
													</div>
													<div class="col-4">
														<div class="form-group">
															<div >
																<input type="checkbox"class="form-check-input" name="major" id="cookies" value="drama"></input>
																<label class="form-check-label" for="cookies">쿠키 유무</label>
															</div>
														</div>
													</div>
												</div>
												<div class="row d-flex align-items-center">
													<label>장르 <span style="color: red">*</span> <span style="font-size: 12px">3개이상 6개이하 체크</span></label>
													<div class="row row-cols-6 d-flex align-items-center">
														<input type="checkbox" class="form-check-input" name="genre" id="drama" value="드라마" />
														<label class="form-check-label" for="drama">드라마</label>
														<input type="checkbox" class="form-check-input" name="genre" id="fantasy" value="판타지" />
														<label class="form-check-label" for="fantasy">판타지</label>
														<input type="checkbox" class="form-check-input" name="genre" id="romance" value="로맨스" />
														<label class="form-check-label" for="romance">로맨스</label>
														<input type="checkbox" class="form-check-input" name="genre" id="ani" value="애니메이션" />
														<label class="form-check-label" for="ani">애니메이션</label>
														<input type="checkbox" class="form-check-input" name="genre" id="mov" value="공포/스릴러" />
														<label class="form-check-label" for="mov">공포/스릴러</label>
														<input type="checkbox" class="form-check-input" name="genre" id="mov" value="액션" />
														<label class="form-check-label" for="mov">액션</label>
													</div>
												</div>
											</div>
										</div>
							        </div>
									
									<div class="form-group">
										<label>스토리</label>
										<textarea class="form-control" rows="8" name='content'></textarea>
									</div>
			
								<div class="form-group border " style="min-height: 200px;">
									<div>
										<label>출연/제작 </label> 
									</div>
														<!-- director -->
								<%-- 	<div class="container d-flex" style="flex-wrap: wrap;">
										<c:forEach var="actor" items="${actorList}">
											<div class="director" style="margin-right: 20px; margin-bottom: 10px;">
												<input type="checkbox" name="actorList" value="<c:out value="${actor.actbno}" />">
												<c:out value="${actor.name}" /><br><c:out value="${actor.age }" />
											</div>
										</c:forEach>
									</div> --%>
											
									<div class="container d-flex" style="flex-wrap: wrap;">
										<c:forEach var="actor" items="${actorList}">
											<div class="director" style="margin-right: 20px; margin-bottom: 10px;">
												<input type="checkbox" name="actorList" value="<c:out value="${actor.actbno}" />">
												<c:out value="${actor.name}" /><br><c:out value="${actor.age }" />
											</div>
										</c:forEach>
									</div>
								</div>
			
									<!--        영화 이미지           -->
			
									<h4 class="color00b0f0">영화 이미지</h4>
			
			
									<div class="form-group border " style="min-height: 200px;">
										<div>
											<label>메인 이미지<span style="color: red">*</span> <span
											style="font-size: 12px">가로 1080x1280px</span></label> <input type=button value="파일 업로드">
										</div>
			
										<div class="border">
											<ul>
												<li class="row" style="width: 230px; height: 76px">
													<div class="col">
														<img src="../resources/img/dune-1.jp" alt="메인 이미지"
															class="border">
													</div>
												</li>
											</ul>
										</div><!-- "border" -->
									</div><!-- form-group -->
									
									
									<div class="form-group border " style="min-height: 200px;">
										<div>
											<label>갤러리 이미지<span style="color: red">*</span> 
											<span style="font-size: 12px">가로 1080x550px</span></label> 
											<input type=button value="파일 업로드">
										</div>
			
										<div class="border">
											<ul>
												<li class="row" style="width: 230px; height: 76px">
													<div class="col">
														<!-- <img src="/resources/img/dune-1.jpg" alt="갤러리 이미지"
															class="border"> -->
													</div>
												</li>
											</ul>
										</div><!-- "border" -->
									</div><!-- form-group -->
							</form>
			
									<div class="row">
										<div class="col-4">	<button type="submit" class="border btn btn-primary w-100 text-white">추가</button></div>
										<div class="col-4">	<button type="reset" class="border btn btn-primary w-100 text-white">초기화</button></div>
										<div class="col-4"><a href="/movies/movieList" class="border btn btn-primary w-100 text-white">돌아가기</a></div>
									</div>
								</div>
						</div>
					</div>
					<!--  end panel-body -->
				</div>
				<!-- /.row -->
		    </div>
		   	<!-- ./ Outer Row -->
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>