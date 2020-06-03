const initListGroupItemsAction = () => {
  const list = document.querySelectorAll('.list-group-item:not(.match-quantity)');
  if (list) {
    list.forEach((listitem) => {
      listitem.addEventListener("click", (event) => {
        // const inputQuantity = document.querySelector(".match-quantity");
        // console.log(event.currentTarget.classList.contains("match-quantity"));
        // console.log(inputQuantity.classList.contains("match-quantity"));
        // if (event.currentTarget != inputQuantity) {
        //   event.preventDefault();
          event.currentTarget.classList.toggle("active");
        // };
      });
    });
  };
};

export{ initListGroupItemsAction };
