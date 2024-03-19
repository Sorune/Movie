
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