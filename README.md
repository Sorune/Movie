# Movie
영화 리뷰 사이트입니다. SpringMVC 프로젝트로 작성되었습니다.
- **server** : http://mbc-webcloud.iptime.org:8013
- **발표 자료**
 - [**ppt**](https://docs.google.com/presentation/d/1lKAp0Cg6FTSGFBMDABHx_WeiZrw1xMKw/edit?usp=sharing&ouid=116141867798055769977&rtpof=true&sd=true)
 - [**프로젝트 파일 목록**](https://docs.google.com/spreadsheets/d/19jr9eYVlFLYpWOqk8AMfHT1sRfH_gx2X/edit#gid=1950376755)
 - [**요구사항 정의서**](https://docs.google.com/spreadsheets/d/1SMDRd1AKgLeBT7kuzCnLaBH_DM3KLJqp/edit#gid=1013520581)

## 🌟프로젝트 개요
영화 리뷰 사이트입니다. 영화에 대해 댓글을 등록하고 평점을 매길 수 있는 시스템을 구축하였습니다.
관리자 계정으로 회원정보 관리가 가능하며, 영화와 배우, 감독의 정보를 등록하고 수정 삭제가 가능합니다.
영화정보 등록시에는 유튜브 링크를 통해 쿠키영상을 등록 할 수 있습니다.
이미지 정보는 캐러셀을 통해서 등록이 가능합니다.

## 📅개발 기간
- 24.03.18 ~ 24.04.03 (약 4주)

## 멤버 구성
- **남태욱** - 팀장, 프로젝트 관리
- **양지웅** - 팀원
- **이서준** - 팀원
- **손희신** - 팀원
- **우성제** - 팀원
- **이태훈** - 팀원

## 개발 환경
- **IDE** : Eclipse, STS4
- **BackEnd**
  - **JAVA** : JAVA 11, jdbc, Spring MVC, Spring Security
- **FrontEnd**
  - **JSP** : JSTL
- **DB** : Oracle
- **배포 환경** : Tomcat
- **VCS** : Git & GitHub, SourceTree

## 주요 기능
1. **회원 관리** : 관리자 계정 로그인시 회원 관리를 할 수 있습니다.
2. **영화 리뷰 등록** : 회원가입 후 영화정보에 대해 리뷰를 남길 수 있습니다.
3. **영화, 배우, 감독 정보 관리 : 관리자가 지정한 매니저 혹은 관리자가 직접 영화, 배우, 감독에 대한 정보를 관리할 수 있습니다.

## 파악한 문제

### 전제 조건
- Java 11 이상
- tomcat 9 이상
