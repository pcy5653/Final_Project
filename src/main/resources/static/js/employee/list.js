// page 처리
const kind = document.getElementsByClassName("kind");
const ki = document.getElementById("k")
const move = document.getElementsByClassName("move");
const page = document.getElementById("page");
const frm = document.getElementById("frm");

for(m of move){
    m.addEventListener("click", function(){
       page.value = this.getAttribute("data-num")
       frm.submit();
    });
}

// $('.pagination').on('click', '.move', function(){
//     const num = $(this).attr('data-num');
//     $('#page').val(num);
//     $('#frm').submit();
// })


let data = ki.getAttribute("data-kind");
for(k of kind){
    if(k.value == data){
        k.selected=true;
        break;
    }
}
