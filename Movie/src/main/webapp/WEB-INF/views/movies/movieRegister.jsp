<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
.red {
	border: 1px solid red;
}

.top-block {
	height: 148px;
}

.color00b0f0 {
	color: #00b0f0;
}

.float-right {
	float: right;
}

.img-small { /* 임시  */
	width: 50px;
	height: auto;
}

ul>li {
	list-style-type: none;
}
</style>
<div class="container">
	<div class="top-block">
		<!-- 상단 안보이는걸 막기위한 div 미디어쿼리 넣어야한다.-->
	</div>

	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">영화 게시판</h2>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">


				<h4 class="color00b0f0">영화정보입력</h4>

				<!-- /.panel-heading -->
				<div class="panel-body">

					<form role="form" action="/board/register" method="post">
						<div class="form-group">
							<label>제목</label> <input class="form-control" name='title'>
						</div>
						<div class="form-group ">
							<label>개봉일</label>
							<div class=" form-control " name='releaseDate'>
								 <input type="date"
									id="date" max="2024-03-20" min="1850-06-05" value="2024-03-20">
							</div>
						</div>
						<div class="form-group">
							<label>장르 <span style="color: red">*</span> <span
								style="font-size: 12px">3개이상 6개이하 체크</span>
							</label>
							<div class="form-control " name='content'>
								<input type="checkbox" name="" value="drama">드라마 <input
									type="checkbox" name="" value="drama">판타지 <input
									type="checkbox" name="" value="drama">로멘스 <input
									type="checkbox" name="" value="drama">일본 <input
									type="checkbox" name="" value="drama">한국 <input
									type="checkbox" name="" value="drama">미국 <input
									type="checkbox" name="" value="drama">애니메이션

							</div>
						</div>
						<div class="form-group">
							<label>시청자의 권장 연령 등급</label>
							<div class="form-control">
								<select>
									<option value="all">전체 이용가</option>
									<option value="7">7세 이상 시청가</option>
									<option value="12">12세 이상 시청가</option>
									<option value="15">15세 이상 시청가</option>
									<option value="19">19세 이상 시청가</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label>쿠키 유무</label>
							<div Class="form-control">
								<input type="checkbox" name="major" value="drama">???
							</div>
						</div>



						<div class="form-group">
							<label>스토리</label>
							<textarea class="form-control" rows="8" name='content'></textarea>
						</div>

						<div class="form-group border " style="min-height: 200px;">
							<div>
								<label>출연/제작 </label> <input type=button value="추가">
							</div>

							<div class="border">
								<ul>
									<li class="row" style="width: 230px; height: 76px">
										<div class="col">
											<img src="../resources/img/dune-1.jp" alt="인물 이미지"
												class="border">
										</div>

										<div class="col border" style="width: 230px; height: 76px">
											<div>이름</div>
											<div>직업</div>
										</div>
									</li>
								</ul>
							</div>
						</div>


						<!--        영화 이미지           -->

						<h4 class="color00b0f0">영화 이미지</h4>


						<div class="form-group border " style="min-height: 200px;">
							<div>
								<label>메인 이미지</label> <input type=button value="파일 업로드">
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
								<label>갤러리 이미지</label> <input type=button value="파일 업로드">
							</div>

							<div class="border">
								<ul>
									<li class="row" style="width: 230px; height: 76px">
										<div class="col">
											<img src="../resources/img/dune-1.jp" alt="갤러리 이미지"
												class="border">
										</div>
									</li>
								</ul>
							</div><!-- "border" -->
						</div><!-- form-group -->


						<button type="submit" class="border btn btn-default">추가하기</button>
						<button type="reset" class="border btn btn-default">돌아가기</button>
					</form>

				</div>
				<!--  end panel-body -->

			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->
</div>
<!-- container -->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>