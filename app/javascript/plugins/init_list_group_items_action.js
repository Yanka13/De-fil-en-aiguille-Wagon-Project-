const initListGroupItemsAction = () => {
  const list = document.querySelectorAll(".list-group-item");
  const listInputs = document.querySelectorAll(".match-quantity");
  if (list) {
    list.forEach((listitem) => {
      listitem.addEventListener("click", (event) => {
        const inputQuantity = event.currentTarget.querySelector(".match-quantity");
        if (event.target != inputQuantity) {
          event.currentTarget.classList.toggle("active");
        };
      });
    });
  };
  listInputs.forEach((input) => {
    input.addEventListener("change", (event) => {
      const item = event.currentTarget.parentNode.parentNode;
      if (!item.classList.contains("active")) {
        item.classList.add("active");
      };
    });
  });
};

export{ initListGroupItemsAction };
