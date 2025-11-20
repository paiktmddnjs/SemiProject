
<br>
<br>

# 🚀 세미프로젝트명 ( 소규모 크리에이터를 위한 협업관리 툴)
> 1인이나 소규모 크리에이터를 위해 재무, 조회수, 협업파악 기능을 각 기능으로 나누어 구현하여 크리에이터로써의 상황을 효율적으로 파악할수 있게 위해 기획하였다!!


<br><br>

## 📘 개요 (Overview)
- 프로젝트 목적과 주요 기능을 간단히 설명
- 기술스택과 핵심 특징 요약
(ex:
	본 프로젝트는 **Servlet과 JSP를 이용한 MVC 패턴 기반의 웹 애플리케이션**으로,  
	회원 관리(로그인·회원가입) 및 게시판 CRUD 기능을 중심으로 구성되었습니다.  
	Oracle 데이터베이스와 JDBC를 통해 데이터 연동을 수행하며,  
	Eclipse + Tomcat 환경에서 실행 가능합니다.
)


<br><br>

## 🧱 기술 스택 (Tech Stack)
| 구분 | 사용 기술 |
|------|------------|
| Frontend | HTML, CSS, JavaScript, JSP |
| Backend | Java (Servlet, JDBC , Spring)|
| Server| Apache Tomcat |
| Database | Oracle |
| Tools | Eclipse, Git, GitHub |

## 🛠️ 설치 및 실행 (Installation & Run)
# 1. 프로젝트 클론
git clone https://github.com/paiktmddnjs/SemiProject

# 2. 이클립스(Eclipse)에서 Import
- File > Import > Existing Projects into Workspace
- 복제한 프로젝트 폴더 선택 후 Import

# 3. 데이터베이스(Oracle) 설정
- Oracle 실행 후 데이터베이스 및 테이블 생성
- src/main/webapp/WEB-INF/classes/sql 폴더 내 SQL 스크립트 실행
- JDBC 연결 정보(application.properties 또는 JDBCTemplate.java) 수정

# 4. Tomcat 서버 설정
- Eclipse > Servers > New > Server > Apache Tomcat 선택
- 프로젝트를 서버에 Add 후 실행

# 5. 웹 애플리케이션 실행
- 브라우저에서 접속
http://자신이 정한 포트번호(ex. localhost:8003)


<br><br>

## 📂 프로젝트 구조 (Directory Structure)
<pre>
📦main
 ┣ 📂java
 ┃ ┗ 📂com
 ┃ ┃ ┗ 📂kh
 ┃ ┃ ┃ ┗ 📂spring
 ┃ ┃ ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┃ ┃ ┣ 📜FilterConfig.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜SecurityConfig.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜WebConfig.java
 ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChannelController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChzzkAuthController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ContentController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ContractController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜DashboardController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜FinancialController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜GlobalControllerAdvice.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜HomeController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜InstagramAuthController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜MemberController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜MyPageController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ProjectController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜RequestController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜TaskController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜WorkspaceController.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜YouTubeController.java
 ┃ ┃ ┃ ┃ ┣ 📂controlloer
 ┃ ┃ ┃ ┃ ┃ ┗ 📂board
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ScheduleController.java
 ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┗ 📜RequestDao.java
 ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChannelDbDto.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChannelDto.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChzzkApiResponse.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChzzkChanelDto.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChzzkChannelDto.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChzzkChannelListContentDto.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChzzkUserInfoDto.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜InstagramChannelDto.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜InstagramdashboardDto.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜YoutubeChannelDto.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜YoutubedashboardDto.java
 ┃ ┃ ┃ ┃ ┣ 📂Entity
 ┃ ┃ ┃ ┃ ┃ ┗ 📜Chanel.java
 ┃ ┃ ┃ ┃ ┣ 📂filter
 ┃ ┃ ┃ ┃ ┃ ┗ 📜RequestTimeFilter.java
 ┃ ┃ ┃ ┃ ┣ 📂interceptor
 ┃ ┃ ┃ ┃ ┃ ┗ 📜LoginCheckInterceptor.java
 ┃ ┃ ┃ ┃ ┣ 📂mapper
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChzzkChanelMapper.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChzzkMemberMapper.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜InstagramChannelMapper.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜RequestMapper.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜YoutubeChannelMapper.java
 ┃ ┃ ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChannelDAO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ContractMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProjectDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TaskDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜WorkspaceDao.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ContentMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FinancialMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MemberMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ScheduleMapper.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ContractService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ContractServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProjectService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TaskService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜WorkspaceService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜WorkspaceServiceImpl.java
 
</pre>


   
<details>
<summary>
    **클릭하여 숨겨진 내용 보기**
</summary>
<pre>  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂vo
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Categorical.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChannelVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Company.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Content.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Contract.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ContractSummary.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Financial.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Member.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MemberVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Monthly.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PageInfo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Project.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProjectVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StatusContainer.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Task.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TaskVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TopThree.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Views.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Workspace.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜WorkspaceMember.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜WorkspaceMemberVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜WorkspaceVo.java	
 ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChanelService.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChzzkAuthService.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChzzkDataService.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ContentService.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ContentServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜FinancialService.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜FinancialServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜InstagramService.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜MemberService.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜MemberServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜RequestService.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ScheduleService.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ScheduleServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜YouTubeService.java
 ┃ ┃ ┃ ┃ ┣ 📂vo
 ┃ ┃ ┃ ┃ ┃ ┗ 📜RequestVo.java
 ┃ ┃ ┃ ┃ ┣ 📜Application.java
 ┃ ┃ ┃ ┃ ┣ 📜ChzzkApplication.java
 ┃ ┃ ┃ ┃ ┣ 📜RestConfig.java
 ┃ ┃ ┃ ┃ ┗ 📜ServletInitializer.java
 ┣ 📂resources
 ┃ ┣ 📂mappers
 ┃ ┃ ┣ 📜ChzzkChanelMapper.xml
 ┃ ┃ ┣ 📜ChzzkMemberMapper.xml
 ┃ ┃ ┣ 📜content-mapper.xml
 ┃ ┃ ┣ 📜contentAn-mapper.xml
 ┃ ┃ ┣ 📜contentCom-mapper.xml
 ┃ ┃ ┣ 📜contractMapper.xml
 ┃ ┃ ┣ 📜financial-mapper.xml
 ┃ ┃ ┣ 📜InstagramChannelMapper.xml
 ┃ ┃ ┣ 📜member-mapper.xml
 ┃ ┃ ┣ 📜request-mapper.xml
 ┃ ┃ ┣ 📜schedule-mapper.xml
 ┃ ┃ ┗ 📜YoutubeChannelMapper.xml
 ┃ ┣ 📂static
 ┃ ┃ ┣ 📂images
 ┃ ┃ ┃ ┣ 📜aleart.PNG
 ┃ ┃ ┃ ┣ 📜checke.PNG
 ┃ ┃ ┃ ┣ 📜circle.PNG
 ┃ ┃ ┃ ┣ 📜project.PNG
 ┃ ┃ ┃ ┗ 📜workspace.PNG
 ┃ ┃ ┣ 📂js
 ┃ ┃ ┃ ┗ 📂fullcalendar
 ┃ ┃ ┃ ┃ ┗ 📜index.global.min.js
 ┃ ┃ ┣ 📜ExpenseEnroll.js
 ┃ ┃ ┣ 📜ExpenseImg.png
 ┃ ┃ ┣ 📜Landing_Page.html
 ┃ ┃ ┣ 📜Login.html
 ┃ ┃ ┣ 📜logo.PNG.png
 ┃ ┃ ┣ 📜MoneyEnroll.js
 ┃ ┃ ┣ 📜MoneyView.css
 ┃ ┃ ┣ 📜ProfitImg.png
 ┃ ┃ ┣ 📜Transaction.css
 ┃ ┃ ┣ 📜랜딩페이지초기.png
 ┃ ┃ ┗ 📜크리에이터.png
 ┃ ┣ 📜application.properties
 ┃ ┗ 📜logback-spring.xml
 ┗ 📂webapp
 ┃ ┣ 📂resources
 ┃ ┃ ┣ 📂css
 ┃ ┃ ┃ ┣ 📜contractList.css
 ┃ ┃ ┃ ┣ 📜dashboard.css
 ┃ ┃ ┃ ┣ 📜insert.css
 ┃ ┃ ┃ ┣ 📜mypage.css
 ┃ ┃ ┃ ┣ 📜scheduleStyle.css
 ┃ ┃ ┃ ┗ 📜theme.css
 ┃ ┃ ┣ 📂images
 ┃ ┃ ┃ ┣ 📜avatar_image.png
 ┃ ┃ ┃ ┣ 📜bell.png
 ┃ ┃ ┃ ┣ 📜bell_icon.png
 ┃ ┃ ┃ ┣ 📜calendar_icon.png
 ┃ ┃ ┃ ┣ 📜contract_icon.png
 ┃ ┃ ┃ ┣ 📜dashboard_icon.png
 ┃ ┃ ┃ ┣ 📜handshake.png
 ┃ ┃ ┃ ┣ 📜handshake_icon.png
 ┃ ┃ ┃ ┣ 📜icon-folder.png
 ┃ ┃ ┃ ┣ 📜logo.png
 ┃ ┃ ┃ ┣ 📜moon_icon.png
 ┃ ┃ ┃ ┣ 📜project_icon.png
 ┃ ┃ ┃ ┣ 📜report_icon.png
 ┃ ┃ ┃ ┣ 📜search_icon.png
 ┃ ┃ ┃ ┣ 📜sidebar_icon.png
 ┃ ┃ ┃ ┣ 📜sun_icon.png
 ┃ ┃ ┃ ┗ 📜video_icon.png
 ┃ ┃ ┣ 📂script
 ┃ ┃ ┃ ┣ 📜scheduleAjax.js
 ┃ ┃ ┃ ┗ 📜scheduleScript.js
 ┃ ┃ ┗ 📂static
 ┃ ┃ ┃ ┣ 📂css
 ┃ ┃ ┃ ┃ ┣ 📜default.css
 ┃ ┃ ┃ ┃ ┣ 📜invite.css
 ┃ ┃ ┃ ┃ ┣ 📜project.css
 ┃ ┃ ┃ ┃ ┣ 📜projectdetail.css
 ┃ ┃ ┃ ┃ ┗ 📜theme.css
 ┃ ┃ ┃ ┣ 📂images
 ┃ ┃ ┃ ┃ ┣ 📜avatar_image.png
 ┃ ┃ ┃ ┃ ┣ 📜bell.png
 ┃ ┃ ┃ ┃ ┣ 📜bell_icon.png
 ┃ ┃ ┃ ┃ ┣ 📜calendar_icon.png
 ┃ ┃ ┃ ┃ ┣ 📜contract_icon.png
 ┃ ┃ ┃ ┃ ┣ 📜dashboard_icon.png
 ┃ ┃ ┃ ┃ ┣ 📜handshake.png
 ┃ ┃ ┃ ┃ ┣ 📜handshake_icon.png
 ┃ ┃ ┃ ┃ ┣ 📜logo.png
 ┃ ┃ ┃ ┃ ┣ 📜moon_icon.png
 ┃ ┃ ┃ ┃ ┣ 📜report_icon.png
 ┃ ┃ ┃ ┃ ┣ 📜search_icon.png
 ┃ ┃ ┃ ┃ ┣ 📜sidebar_icon.png
 ┃ ┃ ┃ ┃ ┣ 📜sun_icon.png
 ┃ ┃ ┃ ┃ ┗ 📜video_icon.png
 ┃ ┃ ┃ ┗ 📂js
 ┃ ┃ ┃ ┃ ┣ 📜modal.js
 ┃ ┃ ┃ ┃ ┣ 📜project.js
 ┃ ┃ ┃ ┃ ┣ 📜project_page.js
 ┃ ┃ ┃ ┃ ┣ 📜taskCard.js
 ┃ ┃ ┃ ┃ ┗ 📜workspace.js
 ┃ ┣ 📂WEB-INF
 ┃ ┃ ┗ 📂views
 ┃ ┃ ┃ ┣ 📂board
 ┃ ┃ ┃ ┃ ┗ 📜schedule.jsp
 ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┃ ┣ 📂icons
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_back_arrow.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_calendar.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_chzzk.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_clock.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_comments.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_delete.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_document.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_folder.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_home.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_instagram.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_like.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_money.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_more_menu.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_plus.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_sponsorships.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_user.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_user_simple.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icon_view.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜icon_youtube.jsp
 ┃ ┃ ┃ ┃ ┗ 📜error.jsp
 ┃ ┃ ┃ ┣ 📂components
 ┃ ┃ ┃ ┃ ┣ 📜footer.jsp
 ┃ ┃ ┃ ┃ ┣ 📜header.jsp
 ┃ ┃ ┃ ┃ ┣ 📜layout.jsp
 ┃ ┃ ┃ ┃ ┣ 📜modals.jsp
 ┃ ┃ ┃ ┃ ┣ 📜sidebar.jsp
 ┃ ┃ ┃ ┃ ┣ 📜task_card.jsp
 ┃ ┃ ┃ ┃ ┗ 📜_teamMemberList.jsp
 ┃ ┃ ┃ ┣ 📂scheduleFragment
 ┃ ┃ ┃ ┃ ┣ 📜scheduleCalendar.jsp
 ┃ ┃ ┃ ┃ ┣ 📜scheduleEventlist.jsp
 ┃ ┃ ┃ ┃ ┣ 📜scheduleProject.jsp
 ┃ ┃ ┃ ┃ ┣ 📜scheduleSemiProject.jsp
 ┃ ┃ ┃ ┃ ┣ 📜scheduleSemiWorkspace.jsp
 ┃ ┃ ┃ ┃ ┣ 📜scheduleStatus.jsp
 ┃ ┃ ┃ ┃ ┗ 📜scheduleWorkspace.jsp
 ┃ ┃ ┃ ┣ 📜channel_list.jsp
 ┃ ┃ ┃ ┣ 📜Chzzk_Login.jsp
 ┃ ┃ ┃ ┣ 📜Content_Management.jsp
 ┃ ┃ ┃ ┣ 📜Content_Management_Detail.jsp
 ┃ ┃ ┃ ┣ 📜contract.jsp
 ┃ ┃ ┃ ┣ 📜dashboard.jsp
 ┃ ┃ ┃ ┣ 📜ExpenseEnroll.jsp
 ┃ ┃ ┃ ┣ 📜index.jsp
 ┃ ┃ ┃ ┣ 📜invite_member.jsp
 ┃ ┃ ┃ ┣ 📜Landing_Page.jsp
 ┃ ┃ ┃ ┣ 📜Login.jsp
 ┃ ┃ ┃ ┣ 📜login2.jsp
 ┃ ┃ ┃ ┣ 📜MoneyView.jsp
 ┃ ┃ ┃ ┣ 📜mypage.jsp
 ┃ ┃ ┃ ┣ 📜new_project.jsp
 ┃ ┃ ┃ ┣ 📜new_task.jsp
 ┃ ┃ ┃ ┣ 📜new_workspace.jsp
 ┃ ┃ ┃ ┣ 📜ProfitEnroll.jsp
 ┃ ┃ ┃ ┣ 📜project.jsp
 ┃ ┃ ┃ ┣ 📜projectdetail.jsp
 ┃ ┃ ┃ ┣ 📜requests.jsp
 ┃ ┃ ┃ ┣ 📜result.jsp
 ┃ ┃ ┃ ┣ 📜set_project.jsp
 ┃ ┃ ┃ ┣ 📜set_workspace.jsp
 ┃ ┃ ┃ ┣ 📜SignUp.jsp
 ┃ ┃ ┃ ┣ 📜Sign_Up.jsp
 ┃ ┃ ┃ ┣ 📜Transaction.jsp
 ┃ ┃ ┃ ┗ 📜workspace.jsp
 ┃ ┣ 📜down.png
 ┃ ┗ 📜loader.jsp
</pre>
</details>

<br><br>

## 🌟 주요 기능 (Key Features)
✅ 회원가입 / 로그인 / 로그아웃 기능
✅ 게시글 등록, 조회, 수정, 삭제 (CRUD)
✅ Oracle DB 연동을 통한 데이터 관리
✅ MVC 패턴 기반 구조로 모듈화된 개발
✅ JSP include를 통한 공통 레이아웃 구성

<br><br>

## 📸 화면 미리보기 (Preview)

| 기능 | 미리보기 |
|------|-----------|
| 로그인 화면 | ![Login Page](./assets/login.gif) |
| 회원가입 화면 | ![Register Page](./assets/register.png) |
| 게시판 목록 | ![Board List](./assets/board-list.jpg) |
| 게시글 작성 | ![Post Write](./assets/post-write.gif) |


<br><br>

## 💡 학습 포인트 (Learning Points)

- JSP & Servlet 기반 MVC 구조 설계 방법 학습
- JDBC를 통한 데이터베이스 연결 및 SQL 처리 로직 구현
- Tomcat 서버를 활용한 배포 및 실행 환경 이해
- JSP 내 JSTL / EL 사용으로 동적 페이지 구현


<br><br>

## 팀원 소개(협업시 추가)

| 이름 | 포지션 | Contact |
| --- | --- | --- |
| 최지원 | AI | a1@gmail.com |
| 최지투 | BE | a1@gmail.com |
| 최지삼 | FE | a1@gmail.com |
| 최지사 | FE | a1@gmail.com |
| 최지오 | FE | a1@gmail.com |
