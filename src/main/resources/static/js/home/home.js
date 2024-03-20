// 요소 선택
      const timeDiv = document.getElementById("time");

      // getTime 함수
      function getTime() {
        let now = new Date();
        //let year = now.getFullYear();
        //let month = now.getMonth() + 1; //getMonth는 0부터 시작하기 때문
        //let date = now.getDate();
        let hour = now.getHours();
        let minute = now.getMinutes();
        let second = now.getSeconds();

        hour = hour < 10 ? "0" + hour : hour;
        minute = minute < 10 ? "0" + minute : minute;
        second = second < 10 ? "0" + second : second;
        // 위의 각 변수에는 시간 데이터가 숫자로 대입되어 있으나 두 자리 또는 한 자리수로 있어
        // 자릿수를 맞추기 위해 삼항연산식을 사용해 10보다 작은 경우 숫자의 앞에 0을 붙여 두 자릿수를 맞춘다.

        timeDiv.innerText = hour + ":" + minute + ":" + second;
      }

      // setInterval 메소드
      getTime();
      setInterval(getTime, 1000);

      let employeeNum = $("#user").attr("data-num");
      let workDate = getTodayDate();

      attendanceTime(employeeNum, workDate);
      function attendanceTime(employeeNum, workDate) {
        $.ajax({
          type: "get",
          url: "./attendanceTime",
          data: {
            employeeNum: employeeNum,
            workDate: workDate,
          },
          success: function (response) {
            if (response.time != null) {
              if (response.time.offTime != null) {
                $("#offTime").text(response.time.offTime);
              }
              if (response.time.onTime != null) {
                $("#onTime").text(response.time.onTime);
              }
            }
          },
          error: function () {
            console.log("ajax 실패");
          },
        });
      }

      function getTodayDate() {
        let today = new Date(); // Mon Dec 20 2021 22:04:03 GMT+0900 (한국 표준시)

        attendanceTime(employeeNum, workDate);
        function attendanceTime(employeeNum, workDate) {
          $.ajax({
            type: "get",
            url: "./attendanceTime",
            data: {
              employeeNum: employeeNum,
              workDate: workDate,
            },
            success: function (response) {
              if (response.time != null) {
                if (response.time.offTime != null) {
                  $("#offTime").text(response.time.offTime);
                }
                if (response.time.onTime != null) {
                  $("#onTime").text(response.time.onTime);
                }
              }
            },
            error: function () {
              console.log("ajax 실패");
            },
          });
        }
      }
      function getTodayDate() {
        let today = new Date(); // Mon Dec 20 2021 22:04:03 GMT+0900 (한국 표준시)

        let year = today.getFullYear();
        let month = ("0" + (today.getMonth() + 1)).slice(-2);
        let day = ("0" + today.getDate()).slice(-2);

        let dateString = year + "-" + month + "-" + day;

        console.log(dateString);

        return dateString;
      }

      // 차트
      let jan = Number($("#01").attr("data-member"));
      let feb = Number($("#02").attr("data-member"));
      let mar = Number($("#03").attr("data-member"));
      let apr = Number($("#04").attr("data-member"));
      let may = Number($("#05").attr("data-member"));
      let jun = Number($("#06").attr("data-member"));
      let jul = Number($("#07").attr("data-member"));
      let aug = Number($("#08").attr("data-member"));
      let sep = Number($("#09").attr("data-member"));
      let oct = Number($("#10").attr("data-member"));
      let nov = Number($("#11").attr("data-member"));
      let dec = Number($("#12").attr("data-member"));

      let chartData = [
        jan,
        feb,
        mar,
        apr,
        may,
        jun,
        jul,
        aug,
        sep,
        oct,
        nov,
        dec,100
      ];


      const ctx = document.getElementById("myChart").getContext("2d");
      new Chart(ctx, {
        type: "line",
        data: {
          labels: [
            "1월",
            "2월",
            "3월",
            "4월",
            "5월",
            "6월",
            "7월",
            "8월",
            "9월",
            "10월",
            "11월",
            "12월",
          ],
          datasets: [
            {
              label: "신규회원수",
              data: chartData,
              borderWidth: 2,
              borderColor: "#696CFF",
              backgroundColor: "#EDEDFF",
              fill: true,
            },
          ],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
          elements: {
            line: {
              tension: 0.4,
            },
          },
        },
      });