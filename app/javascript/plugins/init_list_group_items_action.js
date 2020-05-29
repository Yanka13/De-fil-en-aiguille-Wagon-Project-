const initListGroupItemsAction = () => {
  const list = document.querySelectorAll(".list-group-item");
  if (list) {
    list.forEach((listitem) => {
      listitem.addEventListener("click", (event) => {
        event.currentTarget.classList.toggle("active");
      });
    });
  };
};

export{ initListGroupItemsAction };
