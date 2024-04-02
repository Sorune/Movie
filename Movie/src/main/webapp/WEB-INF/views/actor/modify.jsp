<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container  pt-6">
	<div class="card o-hidden border-0 shadow-lg my-3">
		<div class="card-body p-2">
			<div class="row justify-content-center">
				<div class="row justify-content-center">
					<div class="col-lg-12">
						<c:set value="${atv}" var="actor"></c:set>
						<h4 class="color00b0f0">
							actor -
							<c:out value="${actor.name }"></c:out>
						</h4>
						<div class="row justify-content-center">
							<input type="file" name="imgList" id="file-input"
								accept="image/*" style="display: none;" multiple>
							<form name="modFrm" role="form" action="/actor/modify/${actor.actbno}" method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="row justify-content-center">
									<div class="col-4">
							        	<div id="uploadedImages" class="carousel slide carousel-fade" data-bs-ride="carousel" style="width:90%; height: 90%">
							        		<div class="carousel-inner" style="width:100%; height: 100%">
												<c:forEach items="${actor.imgList}" var="img" varStatus="i" begin="0">
													<c:choose>
													    <c:when test="${not empty img}">
													    	<c:choose>
													    		<c:when test="${ i.index == 0 }">
													    			<div class="carousel-item active">
													    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
																		<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
																		<c:url var="imageUrl" value="/actor/download"/>
																		<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"  width="100%" class="img-fluid" uploadPath="${uploadPath}" uuid="${img.uuid}" fileName="${img.fileName}">
													    			</div>
													    		</c:when>
													    		<c:otherwise>
													    			<div class="carousel-item">
													    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
																		<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
																		<c:url var="imageUrl" value="/member/download"/>
																		<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"  width="100%" class="img-fluid" uploadPath="${uploadPath}" uuid="${img.uuid}" fileName="${img.fileName}">
													    			</div>
													    		</c:otherwise>
													    	</c:choose>
													    </c:when>
													    <c:otherwise>
													        <!-- 이미지가 없는 경우 대체 내용 추가 -->
													        <div id="drop-area" style="width:100%;">
																<p>이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.</p>
										        			</div>
													    </c:otherwise>
													</c:choose>
												</c:forEach>
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
											<div class="row row-cols-2 p-3">
												<label class="col-sm-2 text-align-center">이름</label>
												<div class="col-sm-10">
													<input class="form-control" name='name' id="actorName"
														value='<c:out value="${actor.name}"/>'/>
												</div>
											</div>
											<div class="row row-cols-2 p-3">
												<label class="col-sm-2 text-align-center">나이</label>
												<div class="col-sm-10">
													<input class="form-control" name='age' id="actorAge"
														value='<c:out value="${actor.age}"/>' readonly>
												</div>
											</div>
											<div class="row row-cols-2">
												<div class="form-group text-align-center">
													<label>출생년도</label>
												</div>
												<div class="form-group text-align-center d-flex">
													<label style="margin-right: 3px;">사망년도</label> <input
														type="checkbox" id="ripYear">
												</div>
												<div class="form-group p-3">
													<%-- <fmt:formatDate value="${actor.bDate}" pattern="yyyy-MM-dd" /> --%>
													<input type="date" class="form-control" name="bDate"
														id="date1" onchange="insertBirth()"> <input
														type="hidden" id="hiddenInput" disabled>
												</div>
												<div class="form-group p-3">
													<input type="date" class="form-control" name="dDate"
														id="date2" disabled="disabled">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-4">
										<button type="submit" class="btn btn-success w-100">저장하기</button>
									</div>
									<div class="col-4">
									<button type="reset" class="btn btn-secondary w-100" >내용 지우기</button>
									</div>
									<div class="col-4">
										<a href="/actor/actorList" class="btn btn-info w-100">돌아가기</a>
									</div>
								</div>
							</form>
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

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	

	   
	   // 체크하면 사망년도 datePicker 활성화
	   function ripCheck(event) {
	      // 사망년도 datePicker input 가져오기
	      var ripDate = document.getElementById("date2");
	      if(event.target.checked) {
	         ripDate.disabled = false;
	      }else {
	         ripDate.disabled = true;
	      }
	   }
	   
	   // 출생년도 선택하면 나이 입력되는 메서드
	   function insertBirth() {
	      // 오늘 날짜 구하기
	      var dates = new Date();
	      // 년도만 분리
	      var years = dates.getFullYear();
	      // 월만 분리
	      var month = dates.getMonth();
	      // 일자만 분리
	      var date = dates.getDate();
	      //console.log(String(dates));
	      //console.log(String(years));
	      // String 값으로 년도 치환
	      var st_y = String(years);
	      // String 값으로 달 치환
	      var st_m = String(month);
	      //console.log(String(month));
	      // String 값으로 일자 치환
	      var st_d = String(date);
	      //console.log(String(date));
	      // 포멧팅해서 변수에 저장
	      var format = " year : " + st_y + " month :  " + st_m + " date : " + st_d;
	      console.log(format);
	      // input date(출생년-월-일)값 가져오기
	      var birthday = document.querySelector("#date1").value;
	      // 콘솔에 출력(input date(출생년-월-일)값 가져오기)
	      console.log(birthday);
	      // 출생년도만 자르기
	      var strYMD = birthday.split("-");
	      var strY = strYMD[0];
	      console.log("자른 년도는 : " + strY);
	      // 이번년도 - 출생년도 = 만나이
	      var ages = years - strY;
	      // 콘솔에 출력(이번년도 - 출생년도 = 만나이)
	      console.log(ages); 
	      // 나이칸 변수에 저장
	      var directorAge = document.querySelector("#directorAge");
	      // 계산한 나이 나이칸에 값 저장 및 출력
	      directorAge.value = ages;
	   } 

	
    
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>