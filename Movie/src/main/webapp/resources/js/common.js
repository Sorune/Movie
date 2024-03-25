// 스프링 시큐리티용
const csrfHeader = $("meta[name='_csrf_header']").attr("content");
const csrfToken = $("meta[name='_csrf']").attr("content");
// ver1 star

const checkStar = function(target) { // hidden  처리된 input에 값이 들어올 시 이벤트 처리 메서드를 변수에 저장한다(매개값 : this) 
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

$('.fa-star').on("click", function() {             // 별 아이콘을 누르면 동작한다
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
const dropArea = document.getElementById("uploadedImages");
var fileInput = document.getElementById("file-input");
const imagePreview = document.getElementById("image-preview");
const dataTranster = new DataTransfer();
var uploadedImages = document.getElementById("uploadedImages");
var uploadImageButton = document.getElementById("uploadImage");
var deleteImageButton = document.getElementById("deleteImage");
//var formObj = document.querySelector("form");

if (!(uploadedImages == null)) {
	uploadedImages = uploadedImages.querySelector("div");
}
const inputFile = $("input[name='uploadFile']");

function onClickFunction() {
	fileInput.click();
}

function createUploadFileInput(form) {
	let nodes = document.querySelector("#uploadedImages").querySelectorAll("img");
	let inputString = "";
	$(nodes).each(function(i, obj) {
		let inputFileName = document.createElement("input");
		let inputFilePath = document.createElement("input");
		let inputFileUuid = document.createElement("input");
		inputFileName.type = "hidden";
		inputFileName.setAttribute('name', "imgList[" + i + "].fileName");
		inputFileName.setAttribute('value', obj.getAttribute("fileName"));
		inputFilePath.type = "hidden";
		inputFilePath.setAttribute('name', "imgList[" + i + "].uploadPath");
		inputFilePath.setAttribute('value', obj.getAttribute("uploadPath"));
		inputFileUuid.type = "hidden";
		inputFileUuid.setAttribute('name', "imgList[" + i + "].uuid");
		inputFileUuid.setAttribute('value', obj.getAttribute("uuid"));
		inputString += inputFileName.outerHTML+inputFilePath.outerHTML+inputFileUuid.outerHTML;
	});
	form.append(inputString).submit();
}

function createCarouselInner(fileList) {
	let nodes = document.querySelector("#uploadedImages").querySelector("div").querySelectorAll("div");
	for (var i = 0; i < nodes.length; i++) {
		nodes[i].remove();
	};
	$(fileList).each(function(i, obj) {
		const carouselInner = document.createElement("div");
		if (i == 0) {
			carouselInner.className = "carousel-item active";
		} else {
			carouselInner.className = "carousel-item";
		}
		const img = document.createElement("img");
		var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
		console.log(fileCallPath);
		img.src = "/download?fileName=" + fileCallPath;
		img.setAttribute('width', "100%");
		img.setAttribute('height', "auto");
		img.setAttribute('class', "d-block w-100");
		img.setAttribute('uploadPath', obj.uploadPath);
		img.setAttribute('uuid', obj.uuid);
		img.setAttribute('fileName', obj.fileName);
		carouselInner.appendChild(img);
		uploadedImages.appendChild(carouselInner);
	});
	
	//createUploadFileInput(formObj);
	console.log(uploadedImages);
	dropArea.removeAttribute('eventList');
	dropArea.removeEventListener("click", onClickFunction);
	console.log("event remove");

	let nodeList = document.querySelector("#uploadedImages").querySelector("div").querySelectorAll("div");
	console.log(nodeList);
	if (nodeList.length == 0) {
		var emptyNode = document.createElement("div");
		var emptyP = document.createElement("p");
		emptyNode.setAttribute("id", "drop-area");
		emptyNode.setAttribute("style", "width:100%;");
		emptyP.innerText = "이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.";
		emptyNode.appendChild(emptyP);
		document.querySelector("#uploadedImages").querySelector("div").appendChild(emptyNode);

		dropArea.setAttribute('eventList', 'click');
		dropArea.addEventListener("click", onClickFunction);
		console.log("event set");
	}

};


if (!(dropArea == null)) {
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
		for (let i = 0; i < files.length; i++) {
			let file = files[i];
			if (file && file.type.startsWith("image")) {
				dataTranster.items.add(file);
			}
		};
		inputFile.files = dataTranster.files;
		console.log(inputFile);
		imgUpload(inputFile.files);
	});



	// 클릭 이벤트 처리
	uploadImageButton.addEventListener("click", function() {
		fileInput.click();
	});

	deleteImageButton.addEventListener("click", function() {
		let nodes = document.querySelector("#uploadedImages").querySelector("div").querySelectorAll("div");
		let deleteFile;
		for (let i = 0; i < nodes.length; i++) {
			if (nodes[i].getAttribute("class").includes("active")) {
				deleteFile = nodes[i];
			}
		}
		if(deleteFile != null){
			let deleteFilePath = deleteFile.querySelector("img").getAttribute("uploadpath") + "\\" + deleteFile.querySelector("img").getAttribute('uuid') + "_" + deleteFile.querySelector("img").getAttribute('fileName');
			console.log(deleteFilePath);
			let deleteFileType = "zip";
			$.ajax({
				url: '/deleteFile',
				data: {fileName : deleteFilePath, type : deleteFileType},
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeader, csrfToken);
				},
				type: 'POST',
				success: function(result) {
					console.log(result);
		
					deleteFile.remove();
					nodes = document.querySelector("#uploadedImages").querySelector("div").querySelectorAll("div");
					//console.log(document.querySelectorAll('[fileName='+'"'+deleteFile.querySelector("img").getAttribute('fileName')+'"'+']'));
					//document.querySelector('[fileName='+'"'+deleteFile.querySelector("img").getAttribute('fileName')+'"'+']').remove();
					if (nodes.length != 0) {
						nodes[0].setAttribute("class", nodes[0].getAttribute("class") + " active");
					} else {
						var emptyNode = document.createElement("div");
						var emptyP = document.createElement("p");
						emptyNode.setAttribute("id", "drop-area");
						emptyNode.setAttribute("style", "width:100%;");
						emptyP.innerText = "이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.";
						emptyNode.appendChild(emptyP);
						document.querySelector("#uploadedImages").querySelector("div").appendChild(emptyNode);
					}

				},
				error: function(result) {
					console.log(result);
				}
			}); //$.ajax
		}
	});

};

console.log(!(document.getElementById("drop-area") == null));

console.log(dropArea.dispatchEvent);
if (!(document.getElementById("drop-area") == null)) {

	dropArea.setAttribute('eventList', 'click');
	dropArea.addEventListener("click", onClickFunction);
	console.log("event set");
} else {
	if (document.getElementById("drop-area") == null) {
		if ((!dropArea.getAttribute('eventList') == null)) {
			dropArea.removeAttribute('eventList');
			dropArea.removeEventListener("click", onClickFunction);
			console.log("event remove");
		}
	}
}

if (!(fileInput == null)) {
	// 파일 입력 필드 변경 이벤트 처리
	fileInput.addEventListener("change", function(e) {
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");
		console.log(csrfHeader + " : " + csrfToken);
		var inputFile = document.querySelector("#file-input");
		var formData = new FormData();
		var files = inputFile.files;
		console.log(files);
		for (var i = 0; i < files.length; i++) {
			//if(!checkExtension(files[i].name, files[i].size)){
			//console.log(!checkExtension(files[i].name, files[i].size));
			//	return false;
			//}
			console.log(i + files[i] + files[i].name);
			formData.append("uploadFile", files[i], files[i].name);
		};
		for (var pair of formData.entries()) {
			console.log(pair[0] + ', ' + pair[1]);
		}

		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			data: formData,
			type: 'POST',
			success: function(result) {
				console.log(result);
				createCarouselInner(result);
			},
			error: function(result) {
				alert("uploadFail");
				createCarouselInner(result);
				console.log(result);
			}
		}); //$.ajax
	});

};

function imgUpload(files) {
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");
	var formData = new FormData();
	console.log(files);
	for (var i = 0; i < files.length; i++) {
		//if(!checkExtension(files[i].name, files[i].size)){
		//console.log(!checkExtension(files[i].name, files[i].size));
		//	return false;
		//}
		console.log(i + files[i] + files[i].name);
		formData.append("uploadFile", files[i], files[i].name);
	};
	for (var pair of formData.entries()) {
		console.log(pair[0] + ', ' + pair[1]);
	}
	//var urlString = '/'+ window.location.pathname.split("/")[1]+'/uploadAjaxAction';

	$.ajax({
		url: /* urlString */'/uploadAjaxAction',
		processData: false,
		contentType: false,
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeader, csrfToken);
		},
		data: formData,
		type: 'POST',
		success: function(result) {
			console.log(result);
			createCarouselInner(result);
		},
		error: function(result) {
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


var formObj=$('form[role="form"]');

$("button[type='submit']").on("click",function(e){
	e.preventDefault();
	console.log("submit clicked");
	console.log(formObj);
	//createUploadFileInput(formObj);
	let nodes = document.querySelector("#uploadedImages").querySelectorAll("img");
	let inputString = "";
	$(nodes).each(function(i, obj) {
		let inputFileName = document.createElement("input");
		let inputFilePath = document.createElement("input");
		let inputFileUuid = document.createElement("input");
		inputFileName.type = "hidden";
		inputFileName.setAttribute('name', "imgList[" + i + "].fileName");
		inputFileName.setAttribute('value', obj.getAttribute("fileName"));
		inputFilePath.type = "hidden";
		inputFilePath.setAttribute('name', "imgList[" + i + "].uploadPath");
		inputFilePath.setAttribute('value', obj.getAttribute("uploadPath"));
		inputFileUuid.type = "hidden";
		inputFileUuid.setAttribute('name', "imgList[" + i + "].uuid");
		inputFileUuid.setAttribute('value', obj.getAttribute("uuid"));
		inputString += inputFileName.outerHTML+inputFilePath.outerHTML+inputFileUuid.outerHTML;
	});
	console.log(inputString);
	formObj.append(inputString).submit();
	var formnodes=document.querySelector("form").querySelectorAll("input");
	console.log(formnodes);
	var newForm = document.createElement("form");
	newForm.setAttribute("charset", "UTF-8");

 	newForm.setAttribute("method", "Post");  //Post 방식

 	newForm.setAttribute("action", "/actor/register"); //요청 보낼 주소


	$(formnodes).each(function(i,obj){
		console.log(obj);
		newForm.appendChild(formnodes[i]);
	});
	console.log(newForm);
	newForm.submit();
});

// ajax file upload method
$("#uploadBtn").on("click", (e) => {
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");
	console.log(csrfHeader + " : " + csrfToken);
	var formData = new FormData();
	var inputFile = document.querySelector("#file-input");
	var files = inputFile.files;
	console.log(files);
	for (var i = 0; i < files.length; i++) {
		//if(!checkExtension(files[i].name, files[i].size)){
		//console.log(!checkExtension(files[i].name, files[i].size));
		//	return false;
		//}
		console.log(i + files[i] + files[i].name);
		formData.append("uploadFile", files[i], files[i].name);
	};
	for (var pair of formData.entries()) {
		console.log(pair[0] + ', ' + pair[1]);
	}

	$.ajax({
		url: '/uploadAjaxAction',
		processData: false,
		contentType: false,
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeader, csrfToken);
		},
		data: formData,
		type: 'POST',
		success: function(result) {
			console.log(result);
		},
		error: function(result) {
			alert("uploadFail");
			console.log(result);
		}
	}); //$.ajax
});                