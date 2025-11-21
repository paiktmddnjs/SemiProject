
<br>
<br>

<h1 style="font-size: 36px; 
           color: #FF4136; /* 강렬한 빨간색 */
           font-weight: 1000; /* 최대 굵기 */
           text-align: center; /* 중앙 정렬 */
           text-shadow: 2px 2px #FFDC00;"> 
<h1 align="center" style="font-size: 38px; color: #FF4136; font-weight: 900; text-shadow: 2px 2px #FFDC00;"> 
    🚀 C.R.E.P (Creator Reporting & Efficiency Platform)
</h1>

<h3 align="center">
  **📈 소규모 크리에이터를 위한 올인원협업 & 효율성 극대화 플랫폼**
</h3>
</h1>
<br>
<h4 style="text-shadow: 2px 2px #FFDC00;">
:: 1인이나 소규모 크리에이터를 위해 재무, 조회수, 협업파악 기능 등을 각각 나누어 구현하여 크리에이터로써의 상황을 효율적으로 파악할 수 있게 위하여 기획 ::
</h4>

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
| Tools | Intellij, Sqldeveloper, Git, GitHub |


<br><br>


## 🛠️ 설치 및 실행 (Installation & Run)
# 1. 프로젝트 클론
git clone https://github.com/paiktmddnjs/SemiProject

## 2. IntelliJ IDEA에서 import

- File 메뉴를 클릭합니다.
- Open... (열기)를 선택.
- 로컬 컴퓨터에서 열고자 하는 프로젝트의 최상위 폴더를 찾아서 선택.
- 선택 후, **Open**을 클릭합니다.
- IntelliJ IDEA가 해당 폴더를 프로젝트로 인식. 

# 3. 데이터베이스(Oracle) 설정
- Oracle 실행 후 데이터베이스 및 테이블 생성
- src/main/webapp/WEB-INF/classes/sql 폴더 내 SQL 스크립트 실행
- JDBC 연결 정보(application.properties 또는 JDBCTemplate.java) 수정

# 4. Tomcat 서버 설정
- Eclipse > Servers > New > Server > Apache Tomcat 선택
- 프로젝트를 서버에 Add 후 실행

# 5. 웹 애플리케이션 실행
- 브라우저에서 접속
http://(자신이 정한 포트번호) (ex. localhost:8003)


<br><br>

## 📂 프로젝트 구조 (Directory Structure)
<pre>
📦main
 ┣ 📂java
 ┃ ┗ 📂com
 ┃ ┃ ┗ 📂kh
 ┃ ┃ ┃ ┗ 📂spring
 ┃ ┃ ┃ ┃ 
 <details>
 <summary> 📂 **config (설정)** </summary>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜FilterConfig.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜SecurityConfig.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ 📜WebConfig.java
 </details>
 <details>
 <summary> 📂 **controller**</summary>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChannelController.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChzzkAuthController.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ContentController.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ContractController.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜DashboardController.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜FinancialController.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜GlobalControllerAdvice.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜HomeController.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜InstagramAuthController.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜MemberController.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜MyPageController.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ProjectController.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜RequestController.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜TaskController.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜WorkspaceController.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ 📜YouTubeController.java
 </details>
 <details>
 <summary> 📂 **controlloer/board**</summary>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ 📜ScheduleController.java
 </details>
 <details>
 <summary> 📂 **dao**</summary>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ 📜RequestDao.java
 </details>
 <details>
 <summary> 📂 **dto**</summary>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChannelDbDto.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChannelDto.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChzzkApiResponse.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChzzkChanelDto.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChzzkChannelDto.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChzzkChannelListContentDto.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChzzkUserInfoDto.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜InstagramChannelDto.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜InstagramdashboardDto.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜YoutubeChannelDto.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ 📜YoutubedashboardDto.javas
 </details>
 <details>
 <summary> 📂 **Entity**</summary>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ 📜Chanel.java
 </details>
 <details>
 <summary> 📂 **filter**</summary>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ 📜RequestTimeFilter.java
 </details>
 <details>
 <summary> 📂 **interceptor**</summary>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ 📜LoginCheckInterceptor.java
 </details>
 <details>
 <summary> 📂 **mapper**</summary>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChzzkChanelMapper.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChzzkMemberMapper.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜InstagramChannelMapper.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜RequestMapper.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ 📜YoutubeChannelMapper.java
 </details>
 <details>
 <summary> 📂 **model (DAO, Mapper, Service, VO)**</summary>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📂dao
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜ChannelDAO.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜ContractMapper.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜ProjectDao.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜TaskDao.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┗ 📜WorkspaceDao.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📂mapper
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜ContentMapper.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜FinancialMapper.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜MemberMapper.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┗ 📜ScheduleMapper.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📂service
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜ContractService.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜ContractServiceImpl.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜ProjectService.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜TaskService.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜WorkspaceService.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┗ 📜WorkspaceServiceImpl.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ 📂vo
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜Categorical.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜ChannelVo.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜Company.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜Content.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜Contract.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜ContractSummary.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜Financial.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜Member.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜MemberVo.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜Monthly.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜PageInfo.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜Project.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜ProjectVo.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜StatusContainer.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜Task.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜TaskVo.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜TopThree.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜Views.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜Workspace.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜WorkspaceMember.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📜WorkspaceMemberVo.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┗ 📜WorkspaceVo.java	
 </details>
 <details>
 <summary> 📂 **service**</summary>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChanelService.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChzzkAuthService.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChzzkDataService.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ContentService.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ContentServiceImpl.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜FinancialService.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜FinancialServiceImpl.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜InstagramService.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜MemberService.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜MemberServiceImpl.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜RequestService.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ScheduleService.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ScheduleServiceImpl.java
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ 📜YouTubeService.java
 </details>
 <details>
 <summary> 📂 **vo**</summary>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ 📜RequestVo.java
 </details>
 	┗ 📂resources
  <details>
  <summary> 📂 **mappers (MyBatis XML)**</summary>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChzzkChanelMapper.xml
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ChzzkMemberMapper.xml
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜content-mapper.xml
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜contentAn-mapper.xml
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜contentCom-mapper.xml
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜contractMapper.xml
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜financial-mapper.xml
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜InstagramChannelMapper.xml
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜member-mapper.xml
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜request-mapper.xml
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜schedule-mapper.xml
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ 📜YoutubeChannelMapper.xml
  </details>
  <details>
  <summary> 📂 **static (정적 자원)**</summary>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📂images (이미지 파일)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜aleart.PNG
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜checke.PNG
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜circle.PNG
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜project.PNG
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┗ 📜workspace.PNG
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📂js (JavaScript)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┗ 📂fullcalendar
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┗ 📜index.global.min.js
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ExpenseEnroll.js
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ExpenseImg.png
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜Landing_Page.html
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜Login.html
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜logo.PNG.png
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜MoneyEnroll.js
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜MoneyView.css
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜ProfitImg.png
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜Transaction.css
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📜랜딩페이지초기.png
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ 📜크리에이터.png
  </details>
 ┗ 📂webapp
  <details>
  <summary>📂 **resources** (JSP가 사용하는 CSS/JS/Image)</summary>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📂css
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜contractList.css
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜dashboard.css
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜insert.css
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜mypage.css
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜scheduleStyle.css
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┗ 📜theme.css
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📂images (아이콘 및 UI 이미지)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ ... (이미지 파일 생략)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📂script (개별 스크립트)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜scheduleAjax.js
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃ ┗ 📜scheduleScript.js
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ 📂static (정적 자원)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📂css
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┃ ┣ 📜default.css
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┃ ┣ 📜invite.css
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┃ ┣ 📜project.css
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┃ ┣ 📜projectdetail.css
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┃ ┗ 📜theme.css
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┣ 📂images
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┃ ┣ ... (이미지 파일 생략)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┗ 📂js
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┃ ┣ 📜modal.js
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┃ ┣ 📜project.js
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┃ ┣ 📜project_page.js
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┃ ┣ 📜taskCard.js
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ┃ ┗ 📜workspace.js
  </details>
  <details>
  <summary>📁 **WEB-INF/views** (모든 JSP View 파일)</summary>
  <pre>
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📂board
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┗ 📜schedule.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📂common
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┣ 📂icons
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_back_arrow.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_calendar.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_chzzk.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_clock.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_comments.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_delete.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_document.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_folder.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_home.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_instagram.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_like.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_money.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_more_menu.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_plus.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_sponsorships.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_user.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_user_simple.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┣ 📜icon_view.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┃ ┗ 📜icon_youtube.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┗ 📜error.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📂components
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┣ 📜footer.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┣ 📜header.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┣ 📜layout.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┣ 📜modals.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┣ 📜sidebar.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┣ 📜task_card.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┗ 📜_teamMemberList.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📂scheduleFragment
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┣ 📜scheduleCalendar.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┣ 📜scheduleEventlist.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┣ 📜scheduleProject.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┣ 📜scheduleSemiProject.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┣ 📜scheduleSemiWorkspace.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┣ 📜scheduleStatus.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┃ ┗ 📜scheduleWorkspace.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜channel_list.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜Chzzk_Login.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜Content_Management.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜Content_Management_Detail.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜contract.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜dashboard.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜ExpenseEnroll.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜index.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜invite_member.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜Landing_Page.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜Login.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜login2.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜MoneyView.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜mypage.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜new_project.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜new_task.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜new_workspace.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜ProfitEnroll.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜project.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜projectdetail.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜requests.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜result.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜set_project.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜set_workspace.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜SignUp.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜Sign_Up.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┣ 📜Transaction.jsp
  &nbsp;&nbsp;&nbsp;&nbsp;┃ ┗ 📜workspace.jsp
  &nbsp;&nbsp;┗ 📜loader.jsp
  </pre>
  </details>
</pre>
<br><br>

## 🌟 주요 기능 (Key Features)
✅ 회원가입 / 로그인 / 로그아웃 / 마이페이지 기능 <br>
✅ 프로젝트, 일정 , 재무기록 , 콘텐츠, 워크스페이스 --> 등록, 조회, 수정, 삭제 (CRUD) <br>
✅ Oracle DB 연동을 통한 데이터 관리 <br>
✅ Spring을 이용한 MVC 패턴 기반 구조로 모듈화된 개발 <br>
✅ JSP include를 통한 공통 레이아웃 구성 

<br><br>

## 📸 화면 미리보기 (Preview)

다음은 프로젝트의 주요 화면 미리보기입니다. 게시글 작성 관련 상세 화면은 [클릭하여 펼쳐보기]를 눌러 확인해 주세요.

| 기능 | 미리보기 |
| :---: | :---: |
| **로그인 화면** | <img width="600" alt="로그인 화면" src="https://github.com/user-attachments/assets/55cd5378-d52a-4cef-89a2-4ae030b3427a" /> |
| **회원가입 화면** | <img width="600" alt="회원가입 화면" src="https://github.com/user-attachments/assets/39506618-e899-44e9-a57c-24de409f5583" /> |
| **게시판 목록** | <img width="600" alt="게시판 목록 화면" src="https://github.com/user-attachments/assets/185a6cd0-fadc-4182-a117-204eda41da0e" /> |

<details>
<summary>
  >> 📝 게시글 작성 및 상세 화면 더보기 (클릭) <<
</summary>
<br/>

| 기능 | 미리보기 |
| :---: | :---: |
| 게시글 작성 1 | <img width="600" alt="게시글 작성 1" src="https://github.com/user-attachments/assets/534a9ba5-873c-40b1-88c7-a9b976100b46" /> |
| 게시글 작성 2 | <img width="600" alt="게시글 작성 2" src="https://github.com/user-attachments/assets/254644bb-313c-4670-886f-3911390f01dc" /> |
| 게시글 작성 3 | <img width="600" alt="게시글 작성 3" src="https://github.com/user-attachments/assets/422d24c6-831e-4cee-8209-b33d9a110a01" /> |
| 게시글 작성 4 | <img width="600" alt="게시글 작성 4" src="https://github.com/user-attachments/assets/0c887890-d971-4820-9a90-53b709b1d2d3" /> |
| 게시글 작성 5 | <img width="600" alt="게시글 작성 5" src="https://github.com/user-attachments/assets/b84edc22-b89b-4ba6-b2b7-77aa1f0af856" /> |
| 게시글 작성 6 | <img width="600" alt="게시글 작성 6" src="https://github.com/user-attachments/assets/93199bab-527d-49da-b0a5-20179236ee16" /> |
| 게시글 작성 7 | <img width="600" alt="게시글 작성 7" src="https://github.com/user-attachments/assets/c4372317-4ea7-4bc8-b624-b7c93eff1618" /> |
| 게시글 작성 8 | <img width="600" alt="게시글 작성 8" src="https://github.com/user-attachments/assets/eff670e5-e8df-47aa-ad36-18c566d61af1" /> |
| 게시글 작성 9 | <img width="600" alt="게시글 작성 9" src="https://github.com/user-attachments/assets/ba710384-ac88-4cef-b24b-41cb5cec25a0" /> |

</details>


<br><br>

## 💡 학습 포인트 (Learning Points)

- JSP & Spring 기반 MVC 구조 설계 방법 학습
- Spring을 통한 데이터베이스 연결 및 SQL 처리 로직 구현
- Tomcat 서버를 활용한 배포 및 실행 환경 이해
- JSP 내 JSTL / EL 사용으로 동적 페이지 구현


<br><br>

## 🏆 최종 프로젝트 PPT 🏆 ##

<a href="C.R.E.P 최종프로젝트.pdf" 
   style="font-size: 24px;         /* 글씨 크기 확대 */
          color: #DC3545;          /* 강렬한 빨간색 */
          font-weight: 900;        /* 폰트 굵기를 최대로 */
          text-decoration: underline;"> 🔥 C.R.E.P 최종 프로젝트 보고서 (PDF) 다운로드 🔥
</a>


<br><br>

## 🤝 프로젝트 팀 구성 및 역할 분담

| 이름 | 포지션 | 담당 역할 | GitHub / Contact |
| :---: | :---: | :---: | :--- |
| 👑 **유재현** | **조장 (Team Lead)** | 프로젝트 총괄 및 의사 결정 | **[GitHub: yoo-j-h](https://github.com/yoo-j-h)** |
| ⚙️ **백승원** | **형상 관리자 (SCM)** | Git 브랜치 전략 및 버전 관리 | paiktmddnjs@naver.com |
| 🗄️ **박준언** | **DB 관리자 1** | 데이터베이스 설계 및 초기 구축 | **[GitHub: junown](https://github.com/junown)** |
| 🗄️ **정진혁** | **DB 관리자 2** | 데이터베이스 유지보수 및 최적화 | wjdwlsgur01@gmail.com |
| 🗓️ **장우빈** | **일정 관리자** | Sprint 및 마일스톤 관리 | jwb57863@naver.com |
| 🐞 **이상명** | **이슈 관리자** | 이슈 트래킹 및 피드백 통합 관리 | rockhavesoul@gmail.com |

