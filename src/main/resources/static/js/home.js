// 직급 한글 변환
const position = document.getElementById("position").getAttribute("data-position");
const p = document.getElementById("pInner");

if(position == 'ROLE_CEO'){
    p.innerHTML ='대표';
}else if(position == 'ROLE_GENERAL'){
    p.innerHTML = '총괄 매니저';
}else if(position == 'ROLE_CUSTOMER'){
    p.innerHTML = '고객관리 매니저';
}else if(position == 'ROLE_RESOURCES'){
    p.innerHTML = '인사 매니저';
}else if(position == 'ROLE_FACILITY'){
    p.innerHTML = '시설 매니저';
}else if(position == 'ROLE_TRAINER'){
    p.innerHTML = '트레이너';
}else if(position == 'ROLE_EX'){
    p.innerHTML = '가발령';
}