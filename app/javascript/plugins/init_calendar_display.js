const datePick = document.getElementById("btn-project-datepicker");
const calendar = document.getElementById("project-deadline");

const initCalendarDisplay = () => {
  datePick.addEventListener("click", (event) => {
    console.log(event);
    console.log(event.currentTarget);
    calendar.classList.toggle("d-none");
  });
};

export{ initCalendarDisplay };
