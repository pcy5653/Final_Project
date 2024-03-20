// 이전 페이지
const backBtn = document.getElementById("backBtn")
const r = document.referrer; // 이전 url 확인

backBtn.addEventListener("click", function() {
    window.location.href="/employee/list";
});


// 수정 btn
const btn = document.getElementsByClassName("actionBtn");
const frm = document.getElementById("upfrm");


for(b of btn){
    b.addEventListener("click",function(){
        let url = this.getAttribute("data-url");

        if(url == "/employee/update"){
            if(confirm("정말로 수정하시겠습니까?")){
                frm.action=url;
                frm.submit();
            }else{
                return;
            } 
        }else if(url == "/employee/delete"){
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



// 삭제 btn



