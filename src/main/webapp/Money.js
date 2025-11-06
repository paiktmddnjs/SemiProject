// money.js (AJAX 및 이벤트 위임 로직)

/**
 * 탭 버튼 컨테이너에 이벤트 리스너를 등록합니다.
 * 이 함수는 DOM이 로드된 후에 단 한 번만 실행되어야 합니다.
 */
document.addEventListener('DOMContentLoaded', function() {
    const tabsContainer = document.querySelector('.tabs');
    const placeholder = document.getElementById('chart-placeholder');

    // 탭 컨테이너를 찾을 수 없으면 로직을 중단합니다.
    if (!tabsContainer || !placeholder) {
        console.error("1. 초기 오류: 탭 컨테이너 또는 플레이스홀더를 찾을 수 없습니다.");
        return;
    }

    console.log("0. 이벤트 리스너가 `.tabs` 컨테이너에 성공적으로 등록되었습니다.");

    // 이벤트 위임: 'tabs' 컨테이너에 클릭 이벤트를 등록합니다.
    tabsContainer.addEventListener('click', function(event) {

        // ★★★ 디버깅 로그 추가: 클릭 이벤트가 발생했는지 확인합니다. ★★★
        console.log("2. [클릭 발생] `.tabs` 컨테이너에서 클릭 이벤트 감지됨.");

        // 클릭된 요소가 'tab-button' 클래스를 가진 버튼인지 확인합니다.
        const clickedButton = event.target.closest('.tab-button');

        if (clickedButton) {
            // ★★★ 디버깅 로그 추가: 버튼 요소를 정확히 찾았는지 확인합니다. ★★★
            console.log(`3. [버튼 찾음] 클릭된 버튼의 data-page: ${clickedButton.getAttribute('data-page')}`);

            // 1. 불러올 JSP 파일 이름을 data-page 속성에서 가져옵니다.
            const jspName = clickedButton.getAttribute('data-page');

            if (jspName) {
                // 2. 탭 버튼의 active 상태를 업데이트합니다.
                updateTabActiveState(clickedButton);

                // 3. 차트 콘텐츠를 로드합니다.
                loadChartContent(jspName, placeholder);
            }
        } else {
            console.log("3. [버튼 못 찾음] 클릭은 되었으나, 실제 타겟이 `.tab-button`이 아님.");
        }
    });
});

/**
 * 탭 버튼의 활성화 상태를 시각적으로 업데이트합니다.
 * @param {HTMLElement} newActiveButton 새로 활성화될 버튼 요소
 */
function updateTabActiveState(newActiveButton) {
    // 기존 활성화된 버튼의 'active' 클래스 제거
    const currentActive = document.querySelector('.tab-button.active');
    if (currentActive) {
        currentActive.classList.remove('active');
    }
    // 새로 클릭된 버튼에 'active' 클래스 추가
    newActiveButton.classList.add('active');
}


/**
 * AJAX를 통해 서버에서 차트 콘텐츠를 불러와 삽입합니다.
 * @param {string} jspName 로드할 JSP 파일 이름 (예: 'MoneyBarApi')
 * @param {HTMLElement} placeholder 콘텐츠를 삽입할 DIV 요소
 */
function loadChartContent(jspName, placeholder) {

    // 로딩 표시
    placeholder.innerHTML = '<div style="text-align: center; padding: 50px;">그래프 로딩 중...</div>';

    console.log(`4. [money.js] AJAX 요청 시작: loader.jsp?page=${jspName}`);

    // loader.jsp를 호출하여 서버 내부의 /WEB-INF/views/{jspName}.jsp 내용을 가져옵니다.
    fetch('loader.jsp?page=' + jspName)
        .then(response => {
            if (!response.ok) {
                throw new Error('서버 응답 오류 (Status: ' + response.status + ')');
            }
            return response.text();
        })
        .then(htmlContent => {
            // 받아온 HTML(차트 구조와 스크립트 포함)을 차트 영역에 삽입
            placeholder.innerHTML = htmlContent;
            console.log(`5. [money.js] AJAX 요청 성공: ${jspName} 콘텐츠 DOM에 삽입 완료.`);
        })
        .catch(error => {
            console.error('그래프 로딩 실패:', error);
            placeholder.innerHTML = `<div style="color: red; padding: 20px;">오류: ${jspName} 콘텐츠를 불러오는 데 실패했습니다. 콘솔을 확인하세요.</div>`;
        });
}