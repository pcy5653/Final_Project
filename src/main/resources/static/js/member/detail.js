// 이전 페이지
const backBtn = document.getElementById("backBtn")
const r = document.referrer; // 이전 url 확인

backBtn.addEventListener("click", function() {
    window.location.href="/member/list";
});


// 수정 btn
const btn = document.getElementsByClassName("actionBtn");
const frm = document.getElementById("upfrm");


for(b of btn){
    b.addEventListener("click",function(){
        let url = this.getAttribute("data-url");

        if(url == "/member/update"){
            if(confirm("정말로 수정하시겠습니까?")){
                frm.action=url;
                frm.submit();
            }else{
                return;
            } 
        }else if(url == "/member/delete"){
            if(confirm("정말로 삭제하시겠습니까?")){
                console.log("성공");
                frm.action=url;
                frm.method='post';
                frm.submit();
            }else{
                console.log("실패");
                return;
            }
            
        }
    })
}

const pt = document.getElementsByClassName("ptCount");

for(p of pt){
    if(p.value == ''){
        p.value = "헬스";
    }
}



// 직급 한글 변환
// const position = document.getElementById("position").value;
// const pInner = document.getElementsByClassName("position_inner");


// for(let i=0;i<pInner.length;i++){
//     if(position == 'ROLE_CEO'){
//         pInner[i].innerHTML = '대표';
//     }else if(position == 'ROLE_GENERAL'){
//         pInner[i].innerHTML = '총괄 매니저'
//     }else if(position == 'ROLE_CUSTOMER'){
//         pInner[i].innerHTML = '고객관리 매니저'
//     }else if(position == 'ROLE_RESOURCES'){
//         pInner[i].innerHTML = '인사 매니저'
//     }else if(position == 'ROLE_FACILITY'){
//         pInner[i].innerHTML = '시설 매니저'
//     }else if(position == 'ROLE_TRAINER'){
//         pInner[i].innerHTML = '트레이너 매니저'
//     }else{
//         pInner[i].innerHTML = '가발령 매니저'
//     }
// }