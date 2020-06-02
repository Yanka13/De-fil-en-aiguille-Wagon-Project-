const initCounterOffers = () => {
  let sum = 0;
  const list = document.querySelectorAll(".list-group-item");
  if (list) {
    list.forEach((listitem) => {
      listitem.addEventListener("click", (event) => {
        const listActive = document.querySelectorAll(".list-group-item.active");
        let sum = 0;
        listActive.forEach((element) => {
          let qty = element.querySelector(".match-quantity").value;
          sum += Number.parseInt(qty, 10);
        });
        return(sum);
      });
    });
  };
};

export{ initCounterOffers };
