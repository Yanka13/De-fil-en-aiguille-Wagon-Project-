const list = document.querySelectorAll(".list-group-item");

const initListGroupItemsAction = () => {
  list.forEach((listitem) => {
    listitem.addEventListener("click", (event) => {
      console.log(event);
      console.log(event.currentTarget);
      event.currentTarget.classList.toggle("active");
    });
  });
};

export{ initListGroupItemsAction };
