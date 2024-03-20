// form 전체 입력
const frm = document.getElementById("frm");
const nameI = document.getElementsByClassName("name");
const phone = document.getElementsByClassName("phone");
const address = document.getElementsByClassName("address");
const birth = document.getElementsByClassName("birth");
const nMsg = document.getElementById("nameMsg");
const pMsg = document.getElementById("phoneMsg");
const aMsg = document.getElementById("addressMsg");
const bMsg = document.getElementById("birthMsg");
const addBtn = document.getElementById("addBtn");
const input = document.getElementsByClassName("input");
const ptMonth = document.getElementsByClassName("ptMonth");
let phoneCheck = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
let birthCheck =
  /^(19[0-9][0-9]|20[0-2][0-2])-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
let checks = [false, false, false, false];

// 주소
$("#addressBtn").click(function () {
  adr();
});

function adr() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var addr = ""; // 주소 변수
      var extraAddr = ""; // 참고항목 변수
      let a = "";
      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
      if (data.userSelectedType === "R") {
        // 사용자가 도로명 주소를 선택했을 경우
        addr = data.roadAddress;
      } else {
        // 사용자가 지번 주소를 선택했을 경우(J)
        addr = data.jibunAddress;
      }

      // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
      if (data.userSelectedType === "R") {
        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
          extraAddr += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if (data.buildingName !== "" && data.apartment === "Y") {
          extraAddr +=
            extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
        }
        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        if (extraAddr !== "") {
          extraAddr = " (" + extraAddr + ")";
        }
        // 조합된 참고항목을 해당 필드에 넣는다.
        a = extraAddr;
      } else {
        a = "";
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      a = data.zonecode + addr + a;
      for (addressInput of address) {
        addressInput.value = a;
      }
      // 커서를 상세주소 필드로 이동한다.
      //checks[2] = true;
    },
  }).open();
}

// 성별 checked
let gVal = document.getElementById("genderVal");
const gM = document.getElementById("gender_M");
const gW = document.getElementById("gender_W");

if (gVal.value == "남") {
  gM.checked = true;
} else {
  gW.checked = true;
}

gM.addEventListener("change", function () {
  if (gM.checked) {
    gVal.value = gM.value;
  }
});
gW.addEventListener("change", function () {
  if (gW.checked) {
    gVal.value = gW.value;
  }
});

// 업데이트 유효성검사
for (n of nameI) {
  n.addEventListener("blur", function () {
    nMsg.innerHTML = "";
    if (n.value == "") {
      nMsg.innerHTML = "이름을 입력해주세요";
    } else {
      checks[0] = true;
    }
  });
}

for (p of phone) {
  p.addEventListener("blur", function () {
    pMsg.innerHTML = "";
    if (p.value == "") {
      pMsg.innerHTML = "전화번호를 입력해주세요.";
    } else if (!phoneCheck.test(p.value)) {
      pMsg.innerHTML = "'-'를 빼고 010으로 시작하는 8자리를 입력해주세요.";
    } else {
      checks[1] = true;
    }
  });
}

for (addressInput of address) {
  addressInput.addEventListener("blur", function () {
    aMsg.innerHTML = "";
    if (addressInput.value == "") {
      aMsg.innerHTML = "주소를 입력하세요.";
    }
  });
}

for (b of birth) {
  b.addEventListener("change", function () {
    bMsg.innerHTML = "생일을 입력하세요.";
    let first = birthCheck.test(b.value);
    let check = emptyCheck(b);
    if (!first) {
      bMsg.innerHTML = "과거일자만 입력 가능합니다.";
    } else if (!check) {
      checks[3] = true;
    }
  });
}

function emptyCheck(element) {
  if (element.value == null || element.value.length == 0) {
    return true;
  } else {
    return false;
  }
}

$("#addBtn").click(function () {
  let allCheck = checks.includes(false);
  if (!allCheck) {
    alert("등록하겠습니다!");
    frm.submit();
  } else {
    for (let i = 0; i < checks.length; i++) {
      if (checks[i] == false) {
        input[i].focus();
        alert("모든 항목은 필수작성입니다. 빈칸을 채워주세요!");
        return;
      }
    }
  }
});

// 이전 페이지
const backBtn = document.getElementById("backBtn");
const r = document.referrer; // 이전 url 확인

backBtn.addEventListener("click", function () {
  window.location.href = "/employee/info";
});
