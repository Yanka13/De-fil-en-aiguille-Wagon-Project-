const datePick = document.getElementById("btn-project-datepicker");
const calendar = document.getElementById("project-deadline");

const initCalendarDisplay = () => {
  datePick.addEventListener("click", (event) => {
    calendar.classList.toggle("d-none");
  });
};

export{ initCalendarDisplay };
