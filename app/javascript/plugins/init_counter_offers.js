const initCounterOffers = () => {
  let sum = 0;
  let people = 0;
  let totalPrice = 0;
  const list = document.querySelectorAll(".list-group-item");
  const totalQuantityListDisplay = document.getElementById("offers-total-quantity");
  if (list) {
    list.forEach((listitem) => {
      listitem.addEventListener("click", (event) => {
        const listActive = document.querySelectorAll(".list-group-item.active");
        let sum = 0;
        let people = 0;
        let totalPrice = 0;
        listActive.forEach((element) => {
          let qty = element.querySelector(".match-quantity").value;
          let price = element.querySelector(".paragraph-price").dataset.price;
          sum += Number.parseInt(qty, 10);
          totalPrice += Number.parseInt(price, 10) * Number.parseInt(qty, 10);
          people += 1;
        });
        if (totalPrice === 0) {
          totalQuantityListDisplay.innerHTML = "Vous sollicitez <strong>" + people + "</strong> personne(s) pour <strong>" + sum + "</strong> élément(s) <strong>gratuitement</strong> !";
        } else {
          totalQuantityListDisplay.innerHTML = "Vous sollicitez <strong>" + people + "</strong> personne(s) pour <strong>" + sum + "</strong> élément(s) pour un budget total de <strong>" + totalPrice + "€</strong> !";
        }
        return(totalQuantityListDisplay.innerHTML);
      });
    });
  };
};

export{ initCounterOffers };
