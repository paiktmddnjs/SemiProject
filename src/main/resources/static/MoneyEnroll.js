// **순수 JavaScript 코드입니다. jQuery 사용하지 않음.**

// 팝업 요소 정의
const modal1 = document.getElementById('profitRegistrationModal');
const form1 = document.getElementById('newProfitForm');

// 1. 모달 열기 함수
function openProfitModal() {
    form1.reset(); // 폼 초기화
    modal1.classList.remove('hidden'); // hidden 클래스 제거
}

// 2. 모달 닫기 함수
function closeProfitModal() {
    modal1.classList.add('hidden'); // hidden 클래스 추가
}

// 3. 폼 제출 핸들러 (AJAX/Fetch API를 사용한 서버 통신 준비)
function submitNewProfit() {
    // 폼 유효성 검사
    if (!form1.checkValidity()) {
        form1.reportValidity();
        return;
    }

    const form1Data = new FormData(form1);
    const data = {
        category: form1Data.get('category'),
        description: form1Data.get('finacialName'),
        amount: parseInt(form1Data.get('finacialAmount')),
        profitDate: form1Data.get('finacialDate')
    };

    console.log("서버로 전송할 데이터:", data);

    // ------------------------------------------------
    // ⚠️ TODO: 실제 서버 통신 (Fetch API 사용 예시)
    // ------------------------------------------------
     fetch('/api/profits', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => {
        if (!response.ok) throw new Error('서버 통신 실패');
        return response.json();
    })
    .then(result => {
        alert('✅ 수익 등록이 완료되었습니다.');
        closeProfitModal();
        // 목록/차트 새로고침 로직 (필요시)
    })
    .catch(error => {
        alert('❌ 등록 실패: ' + error.message);
    });


    // 서버 통신 대신 임시 처리:
    alert('✅ 등록 완료! 서버로 전송 준비되었습니다.');
    closeProfitModal();
}



