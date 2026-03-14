
<br>
<br>

<h1 align="center" style="font-size: 50px; color: #FF4136; font-weight: 900; text-shadow: 2px 2px #FFDC00;"> 
    🚀세미프로젝트명 : C.R.E.P (Creator Reporting & Efficiency Platform)
</h1>

<h3 align="center">
  **📈 성장을 디자인하다: 소규모 크리에이터를 위한 올인원 협업 & 효율성 극대화 플랫폼**
</h3>

---

<h4 align="center" style="font-size: 20px; color: #A9A9A9; font-weight: bold;">
    1인이나 소규모 크리에이터를 위해 재무, 조회수, 협업파악 기능 등을 각각 나누어 구현하여 <br> 크리에이터로써의 상황을 효율적으로 파악할 수 있게 하기 위하여 기획
</h4>

<br><br>

## 📘 개발 목표 (Overview)
✔ 콘텐츠 업로드 일정, 플랫폼별 통계 수집, 수익 정산 등 반복 업무를 자동화하여 크리에이터의 운영 부담을 최소화 <br>
✔ 여러 플랫폼(유튜브, 인스타그램 등)의 수익 데이터를 한곳에서 확인하고, 지출 내역과 결합하여 전체적인 실시간 손익 분석 <br>
✔ 조회수 추세, 콘텐츠 성과, 구독자 댓글 데이터를 분석하여 현재의 콘텐츠 경향과 향후 콘텐츠 방향성을 손쉽게 판단<br>
✔ 편집자, 디자이너 등 외부 인력과의 작업 요청·검수·정산 프로세스를 투명하고 효율적으로 관리할 수 있는 협업 환경을 제공 <br>



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
| **랜딩 페이지** | <img width="600" alt="게시판 목록 화면" src="https://github.com/user-attachments/assets/185a6cd0-fadc-4182-a117-204eda41da0e" /> |

<details>
<summary>
  >> 📝 게시글 작성 및 상세 화면 더보기 (클릭) <<
</summary>
<br/>

| 기능 | 미리보기 |
| :---: | :---: |
| 마이페이지 | <img width="600" alt="게시글 작성 1" src="https://github.com/user-attachments/assets/534a9ba5-873c-40b1-88c7-a9b976100b46" /> |
| 대시보드 | <img width="600" alt="게시글 작성 2" src="https://github.com/user-attachments/assets/254644bb-313c-4670-886f-3911390f01dc" /> |
| 일정관리 | <img width="600" alt="게시글 작성 3" src="https://github.com/user-attachments/assets/422d24c6-831e-4cee-8209-b33d9a110a01" /> |
| 콘텐츠 관리 | <img width="600" alt="게시글 작성 4" src="https://github.com/user-attachments/assets/0c887890-d971-4820-9a90-53b709b1d2d3" /> |
| 재무 관리 | <img width="600" alt="게시글 작성 5" src="https://github.com/user-attachments/assets/b84edc22-b89b-4ba6-b2b7-77aa1f0af856" /> |
| 협찬 계약 | <img width="600" alt="게시글 작성 6" src="https://github.com/user-attachments/assets/93199bab-527d-49da-b0a5-20179236ee16" /> |
| 프로젝트 관리 | <img width="600" alt="게시글 작성 7" src="https://github.com/user-attachments/assets/c4372317-4ea7-4bc8-b624-b7c93eff1618" /> |
| 프로젝트 관리 - 프로젝트 선택 | <img width="600" alt="게시글 작성 8" src="https://github.com/user-attachments/assets/eff670e5-e8df-47aa-ad36-18c566d61af1" /> |
| 프로젝트 관리 - 팀 관리 | <img width="600" alt="게시글 작성 9" src="https://github.com/user-attachments/assets/ba710384-ac88-4cef-b24b-41cb5cec25a0" /> |

</details>


<br><br>

## 💡 학습 포인트 (Learning Points)

- JSP & Spring 기반 MVC 구조 설계 방법 학습
- Spring을 통한 데이터베이스 연결 및 SQL 처리 로직 구현
- Tomcat 서버를 활용한 배포 및 실행 환경 이해
- JSP 내 JSTL / EL 사용으로 동적 페이지 구현


<br><br>

## 🏆 최종 프로젝트 PPT 🏆 ##

<a href="https://file.notion.so/f/f/b57435fc-bd9d-8113-8fa8-00031ce9b39d/743cfebb-3d56-4b8c-92dd-795e381cd8db/C.R.E.P_%EC%B5%9C%EC%A2%85%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8.pdf?table=block&id=2b1435fc-bd9d-8053-a7fd-ede520a595d8&spaceId=b57435fc-bd9d-8113-8fa8-00031ce9b39d&expirationTimestamp=1772611200000&signature=Hhh5Swl5QVUlys4-iC_4Y-ykYVvIreCBwbsxp4IA3yc&downloadName=C.R.E.P+%EC%B5%9C%EC%A2%85%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8.pdf" 
   style="font-size: 24px;         /* 글씨 크기 확대 */
          color: #DC3545;          /* 강렬한 빨간색 */
          font-weight: 900;        /* 폰트 굵기를 최대로 */
          text-decoration: underline;"> 🔥 C.R.E.P 최종 프로젝트 보고서 🔥
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

