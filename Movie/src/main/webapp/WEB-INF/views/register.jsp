<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container pt-6">
    <div class="card o-hidden border-0 shadow-lg my-3">
        <div class="card-body p-2">
            <!-- Nested Row within Card Body -->
         
               <div class="row justify-content-center">
                   <div class="col-lg-7 p-5">
                       <div class="text-center">
                           <h1 class="h4 text-gray-900 mb-4">회원가입을 해보자 !</h1>
                       </div>
                       <form class="user" action="/register" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value = "${_csrf.token}"/>
							<div class="form-group">
                               <div class="col-sm-6 mb-3 mb-sm-1">
                                   <input type="text" class="form-control form-control-user" id="ID" name="id" placeholder="아이디">
                               </div>
                           </div>
                           <div class="form-group">
                               <div class="mb-sm-1">
                               	<input type="password" class="form-control form-control-user" id="pw" name="pw" placeholder="비밀번호">
                            	</div>
                        	</div>
                           <div class="form-group row">
                               <div class="col-sm-6 mb-3 mb-sm-5">
                                   <input type="text" class="form-control form-control-user" id="name" name="name" placeholder="이름">
                               </div>
                               <div class="col-sm-6 ">
                                   <input type="text" class="form-control form-control-user"id="Nickname" name="nickName" placeholder="닉네임">
                               </div>
                           </div>
							 <div class="form-group">
                               <div class="col-sm-6 mb-3 mb-sm-1">
                                   <input type="text" class="form-control form-control-user" id="phone" name="phone" placeholder="핸드폰번호">
                               </div>
                               </div>
							<div class="form-group row">
								<div class="col-sm-6 mb-sm-1">
									<input type="text" class="form-control form-control-user" name="zonecode" placeholder="우편번호">
								</div>
								<div class="col-sm-6">
									<a type="button" class="btn btn-primary btn-user btn-block" id="addressInput">우편번호</a>
								</div>
								<div class="col-sm-12 mb-sm-1">
									<input type="text" class="form-control form-control-user" name="roadAddress" placeholder="도로명주소">
								</div>
								<div class="col-sm-12 mb-sm-1">
									<input type="text" class="form-control form-control-user" name="buildingName" placeholder="건물이름">
	                            </div>
								<div class="col-sm-6 mb-sm-3">
									<input type="text" class="form-control form-control-user" name="adress" placeholder="나머지">
								</div>
						</div>
						<div class="row">
						    <button type="submit" class="col-sm-6 btn btn-primary btn-user btn-block">
                                회원가입
                            </button>
	                        <div class="col-sm-6 text-center">
	                            <a class="small" href="/loginAuth">로그인으로 돌아가기</a>
	                        </div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
console.log(document.getElementById("addressInput"));
document.getElementById("addressInput").addEventListener("click",function(){
	new daum.Postcode({
		oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        	document.querySelector('[name=zonecode]').value = data.zonecode;
        	document.querySelector('[name=roadAddress]').value = data.roadAddress;
        	document.querySelector('[name=buildingName]').value = data.buildingName;
        }
    }).open();
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>