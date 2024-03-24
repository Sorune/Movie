// 스프링 시큐리티용
const csrfHeader = "${_csrf.headerName}";
const csrfToken = "${_csrf.token}";
// ver1 star

const checkStar = function (target) { // hidden  처리된 input에 값이 들어올 시 이벤트 처리 메서드를 변수에 저장한다(매개값 : this) 
    document.querySelector(`.star span`).style.width = `${target.value * 20}%`; // 요소의 클래스네임이 star 안의 span 태그의 css 속성을 주고 너비는 hidden된 input의 값 x 20%를 너비로 준다
    // 두개의 별5개를 포지션상으로 겹친 후, 색이들어올 별5개의 초기값은 너비가 0이고 input의 값 x 20% 만큼씩 누르면 배경색이 채워지면 반개씩 별을 채운다
    var targetValue = document.getElementById("inputVal").value; // targetValue : hidden된 input의 값을 변수에 담는다
    document.getElementById("score").innerText = targetValue; // className이 print인 태그안의 className이 score인 요소의 text를 값을 담은 변수 targetValue를 넣는다.
}

// ver2 star
/**
 *  (제이쿼리 메서드 설명)
 *  on()             : 이벤트를 받는 메서드 ex) on(이벤트, 동작할 메서드)
 *  css()            : HTML 태그에 CSS 속성을 부여한다 ex) css(속성명, 값)                                        
 *  $(this)          : 자기 자신을 선택한다
 *  index()          : 자기 자신의 순서를 찾는 제이쿼리 메서드
 *  addClass()       : HTML 태그에 className을 추가한다
 *  removeClass()    : HTML 태그에 className을 삭제한다
 *  prevAll()        : 선택한 요소의 이전의 요소들을 찾는다
 *  nextAll()        : 선택한 요소의 이후의 요소들을 찾는다
*/

$('.print .comment').css("color", "gray");          // 0점일 경우 comment의 color는 gray로 유지

$('.fa-star').on("click", function () {             // 별 아이콘을 누르면 동작한다
    $(this).addClass('active');                     // 별 아이콘을 누르면 누른별의 클래스가 적용된다
    $(this).prevAll().addClass('active');           // 누른 별 아이콘을 기준으로 이전의 별들의 클래스를 모두 적용한다 (점수 올리기)
    $(this).nextAll().removeClass('active');        // 누른 별 아이콘을 기준으로 이후의 별들의 클래스를 모두 삭제한다 (점수 내리기)

    var num = $(this).index();                      // 누른 별의 순서를 변수에 저장한다
    var sratRate = num + 1;                         // index는 0번 부터 시작이므로  num의 값에 1을 더해준다

    var strArr = ["별로에요ㅠ",                        // 변수에 점수에 맞는  comment를 배열로 저장한다
                    "그저그래요..", 
                    "좋아요 :)", 
                    "아주좋아요^▽^", 
                    "최고에요>ㅁ<b"];

    $('.print .comment').css("color", "white");     // comment의 color는 white 변경

    switch (sratRate) {
        case 1:                                     // 1점일 경우
            $('.print .score').text(sratRate);      // 저장한 순서를 아래의 text의 span tag안에 값으로 넣는다
            $('.print .comment').text(strArr[0]);   // 변수(String)의 값의 배열 순서와 점수를 일치하는 것을 text에 넣는다
            break;
        case 2:                                     // 2점일 경우
            $('.print .score').text(sratRate);
            $('.print .comment').text(strArr[1]);
            break;
        case 3:                                     // 3점일 경우
            $('.print .score').text(sratRate);
            $('.print .comment').text(strArr[2]);
            break;
        case 4:                                     // 4점일 경우
            $('.print .score').text(sratRate);
            $('.print .comment').text(strArr[3]);
            break;
        case 5:                                     // 5점일 경우
            $('.print .score').text(sratRate);
            $('.print .comment').text(strArr[4]);
            break;
    }

});

// file upload drag 
const dropArea = document.getElementById("drop-area");
const fileInput = document.getElementById("file-input");
const imagePreview = document.getElementById("image-preview");
const dataTranster = new DataTransfer();
const uploadedImages = document.getElementById("uploadedImages").querySelector("div");
console.log(uploadedImages);
const inputFile = $("input[name='uploadFile']");

function createUploadFileInput(form){
	let nodes = document.querySelector("#uploadedImages").querySelectorAll("img");
	$(nodes).each(function(i,obj){
		console.log(obj.getAttribute("uploadPath"));
		console.log(obj.getAttribute("uuid"));
		console.log(obj.getAttribute("fileName"));
		let inputFile =  document.createElement("input");
		inputFile.type = "hidden";
		inputFile.setAttribute('name',"imgList["+i+"]");
		inputFile.setAttribute('uploadPath',obj.getAttribute("uploadPath"));
		inputFile.setAttribute('uuid',obj.getAttribute("uuid"));
		inputFile.setAttribute('fileName',obj.getAttribute("fileName"));
		console.log(inputFile);
		//form.appendChild(inputFile);
	});
}


function createCarouselInner(fileList){
    let nodes = document.querySelector("#uploadedImages").querySelector("div").querySelectorAll("div");
    for(var i = 0 ; i < nodes.length ; i ++){
		nodes[i].remove();
	};
	$(fileList).each(function(i,obj){
		const carouselInner = document.createElement("div");
		if ( i == 0){
			carouselInner.className = "carousel-item active";
		} else {
			carouselInner.className = "carousel-item";
		}
		const img = document.createElement("img");
		var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
		console.log(fileCallPath);
		img.src = "/download?fileName="+fileCallPath;
		img.setAttribute('width',"100%");
		img.setAttribute('height',"auto");
		img.setAttribute('class',"d-block w-100");
		img.setAttribute('uploadPath',obj.uploadPath);
		img.setAttribute('uuid',obj.uuid);
		img.setAttribute('fileName',obj.fileName);
    	carouselInner.appendChild(img);
    	uploadedImages.appendChild(carouselInner);
	});
	console.log(uploadedImages);
};

if(!(dropArea==null)){
	// 드래그 앤 드롭 이벤트 처리
	dropArea.addEventListener("dragover", (e) => {
	    e.preventDefault();
	    dropArea.style.backgroundColor = "#eee";
	});
	
	dropArea.addEventListener("dragleave", () => {
	    dropArea.style.backgroundColor = "#fff";
	});

	dropArea.addEventListener("drop", (e) => {
		const dataTranster = new DataTransfer();
		const inputFile = document.querySelector("#file-input");
	    e.preventDefault();
	    dropArea.style.backgroundColor = "#fff";
	    const files = e.dataTransfer.files;
	    for(let i = 0; i < files.length ; i++){
			let file = files[i];
			if (file && file.type.startsWith("image")) {
	        	dataTranster.items.add(file);
	    	}
		};
		inputFile.files = dataTranster.files;
		console.log(inputFile);
		imgUpload(inputFile.files);
	});


	// 파일 입력 필드 변경 이벤트 처리
	fileInput.addEventListener("change", function(e){
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");
		console.log(csrfHeader+" : "+csrfToken);
		var inputFile = document.querySelector("#file-input");
		var formData = new FormData();
		var files = inputFile.files;
		console.log(files);
		for(var i = 0 ; i< files.length;i++){
			//if(!checkExtension(files[i].name, files[i].size)){
				//console.log(!checkExtension(files[i].name, files[i].size));
			//	return false;
			//}
			console.log(i+files[i]+files[i].name);
			formData.append("uploadFile",files[i],files[i].name);
		};
		for (var pair of formData.entries()) {
	                console.log(pair[0]+ ', ' + pair[1]); 
	            }
	
		$.ajax({
					url : '/uploadAjaxAction',
					processData : false,
					contentType : false,
					beforeSend : function(xhr){
						xhr.setRequestHeader(csrfHeader,csrfToken);
					},
					data : formData,
					type : 'POST',
					success : function(result) {
						console.log(result);
						createCarouselInner(result);
					},
					error: function(result){
						alert("uploadFail");
						createCarouselInner(result);
						console.log(result);
					}
				}); //$.ajax
	});
	
	// 클릭 이벤트 처리
	dropArea.addEventListener("click", () => {
	    fileInput.click();
	});
}


function imgUpload(files){
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");
	var formData = new FormData();
	console.log(files);
	for(var i = 0 ; i< files.length;i++){
		//if(!checkExtension(files[i].name, files[i].size)){
			//console.log(!checkExtension(files[i].name, files[i].size));
		//	return false;
		//}
		console.log(i+files[i]+files[i].name);
		formData.append("uploadFile",files[i],files[i].name);
	};
	for (var pair of formData.entries()) {
                console.log(pair[0]+ ', ' + pair[1]); 
            }

	$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				beforeSend : function(xhr){
					xhr.setRequestHeader(csrfHeader,csrfToken);
				},
				data : formData,
				type : 'POST',
				success : function(result) {
					console.log(result);
					createCarouselInner(result);
				},
				error: function(result){
					alert("uploadFail");
					console.log(result);
				}
			}); //$.ajax
}
// 이미지 표시 메서드
function displayImage(file) {
    const reader = new FileReader();
    reader.onload = () => {
		
        imagePreview.src = reader.result;
        imagePreview.style.display = "block";
    };
    reader.readAsDataURL(file);
}

function displayImage(file, caroucel) {
    const reader = new FileReader();
    reader.onload = () => {
		caroucel.className = "d-block w-100"; 
		caroucel.style.objectFit = "cover";
        caroucel.src = reader.result;
        caroucel.style.display = "block";
    };
    reader.readAsDataURL(file);
}

// ajax file upload method
$("#uploadBtn").on("click", (e) => {
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");
	console.log(csrfHeader+" : "+csrfToken);
	var formData = new FormData();
	var inputFile = document.querySelector("#file-input");
	var files = inputFile.files;
	console.log(files);
	for(var i = 0 ; i< files.length;i++){
		//if(!checkExtension(files[i].name, files[i].size)){
			//console.log(!checkExtension(files[i].name, files[i].size));
		//	return false;
		//}
		console.log(i+files[i]+files[i].name);
		formData.append("uploadFile",files[i],files[i].name);
	};
	for (var pair of formData.entries()) {
                console.log(pair[0]+ ', ' + pair[1]); 
            }

	$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				beforeSend : function(xhr){
					xhr.setRequestHeader(csrfHeader,csrfToken);
				},
				data : formData,
				type : 'POST',
				success : function(result) {
					console.log(result);
				},
				error: function(result){
					alert("uploadFail");
					console.log(result);
				}
			}); //$.ajax
});                