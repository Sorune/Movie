//아이콘 바꿔 별점주기 start
const addStar = function (target) { // hidden  처리된 input에 값이 들어올 시 이벤트 처리 메서드를 변수에 저장한다(매개값 : this) 
document.querySelector(`.starAdd span`).style.width = `${target.value * 20}%`; // 요소의 클래스네임이 star 안의 span 태그의 css 속성을 주고 너비는 hidden된 input의 값 x 20%를 너비로 준다
// 두개의 별5개를 포지션상으로 겹친 후, 색이들어올 별5개의 초기값은 너비가 0이고 input의 값 x 20% 만큼씩 누르면 배경색이 채워지면 반개씩 별을 채운다
var targetValue = document.getElementById("inputs").value; // targetValue : hidden된 input의 값을 변수에 담는다
document.getElementById("scores").innerText = targetValue; // className이 print인 태그안의 className이 score인 요소의 text를 값을 담은 변수 targetValue를 넣는다.
var valInput = document.getElementById("scores").innerText;
document.getElementById("starVal").value = valInput;
console.log(starVal.value);
} 


$(document).ready(function(){
	/*
	$("#commentBtn").on("click", (e) => {
		e.preventDefault();
	var csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
	var csrfTokenValue = $("meta[name='_csrf']").attr("content");
	
	//var formData = document.querySelector("form[role='form']");
	var formData ={};
	$('form[role="form"] input').each(function(index, element) {
        formData[element.name] = element.value;
    });
    $('form[role="form"] textarea').each(function(index, element) {
        formData[element.name] = element.value;
    });
	console.log(formData);
	$.ajax({
		type: 'POST',
		url: "/regComment",
		processData: false,
		contentType: "application/json",
		beforeSend: function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
		data:  JSON.stringify(formData),
		dataType: "application/json",
		success: function(result){
			console.log(result);
			alert("success!")
			},
		error:function(result){
			console.log(result);
			alert("fail!");
			}
		
			
		});
	
	});
*/

/*
var movBnoVal = '<c:out value="${movie.movBno}"/>';
  var commentUL = $(".chat");
  
    showList(1);
    
    function showList(page){
    	
    	console.log("show list " + page);
        
        MoviesCommentService.getCommentList({movBno:movBnoVal,page: page|| 1 }, function(replyCnt, list) {
          
        console.log("replyCnt: "+ replyCnt );
        console.log("list: " + list);
        console.log(list);
        
        if(page == -1){
          pageNum = Math.ceil(replyCnt/10.0);
          showList(pageNum);
          return;
        }
          
         var str="";
         
         if(list == null || list.length == 0){
           return;
         }
         
         for (var i = 0, len = list.length || 0; i < len; i++) {
           str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
           str +="  <div><div class='header'><strong class='primary-font'>["
        	   +list[i].rno+"] "+list[i].replyer+"</strong>"; 
           str +="    <small class='pull-right text-muted'>"
               +replyService.displayTime(list[i].replyDate)+"</small></div>";
           str +="    <p>"+list[i].reply+"</p></div></li>";
         }
         
         commentUL.html(str); // html에 나타 나는 장치
         
         showReplyPage(replyCnt);

     
       });//end function
         
     }//end showList
*/


	$("#commentBtn").on("click", (e) => {
	   	e.preventDefault();
	    var csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
	    var csrfTokenValue = $("meta[name='_csrf']").attr("content");
	
	    var formData = $("form[role='form']").serialize(); // 직렬화된 폼 데이터를 가져옴
	
	    console.log(formData);
	    $.ajax({
	        type: 'POST',
	        url: "/regComment",
	        beforeSend: function(xhr){
	            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	        },
	        data: formData, // 직렬화된 폼 데이터를 전송
	        success: function(result){
	            console.log(result);
	            alert("success!");
	             //location.reload();
	             updateCommentList();
	        },
	        error:function(result){
	            console.log(result);
	            alert("fail!");
	        }
	    });
	});



	
function likeAction(event) {
    event.preventDefault();

	var likeVal = document.getElementById("#like_btn").value;

   // var likeVal = $("#like_btn").val(); // jQuery를 사용하여 값 가져오기
    var comBno = "${comment.comBno}"; // JSP 표현식을 사용하여 서버에서 가져온 값 사용하기

    console.log(likeVal);
    console.log(comBno);

/*
    $.ajax({
        type: "POST",
        url: "/like",
        data: { comBno: comBno, likeVal: likeVal },
        success: function(data, status) {
            alert(status);
        },
        error: function(xhr, status, error) {
            alert(status + " error!");
        }
    });
    */
}

	

	/*	
		// 댓글 목록을 업데이트하는 함수
	function updateCommentList() {
	    $.ajax({
	        type: 'GET',
	        url: "/getComments", // 댓글 목록을 가져오는 엔드포인트
	        success: function(comments){
	            // 서버로부터 받은 댓글 목록을 이용하여 화면에 출력
	            renderComments(comments); 
	        },
	        error:function(result){
	            console.log(result);
	            alert("댓글 목록을 가져오는데 실패하였습니다.");
	        }
	    });
	}
	
	// 받은 댓글 목록을 화면에 출력하는 함수
	function renderComments(comments) {
	    // 댓글 목록을 출력할 곳의 HTML 요소를 선택하여 초기화
	    var commentList = $("#commentList");
	    commentList.empty();
	
	    // 각 댓글을 순회하며 화면에 출력
	    comments.forEach(function(comment) {
	        var commentItem = $("<li>").text(comment.content);
	        commentList.append(commentItem);
	    });
	}
		*/

});// .document.ready