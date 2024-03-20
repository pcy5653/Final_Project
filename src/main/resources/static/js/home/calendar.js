//full calendar
    document.addEventListener("DOMContentLoaded", function () {
      const calendarEl = document.getElementById("calendar");

      const calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: "dayGridMonth",
        headerToolbar: {
          left: "",
          center: "title",
          right: "",
        },
        titleFormat: "YYYY년 M월",
        height: "100%",
        fixedWeekCount: false,
        events: "/attendance/month"
      });
      //캘린더 그리기
      calendar.render();
    });