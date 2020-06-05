const initListGroupItemsAction = () => {
  const list = document.querySelectorAll(".list-group-item");
  const baskets = document.querySelectorAll(".basket");
  if (list) {
    list.forEach((listitem) => {
      listitem.addEventListener("click", (event) => {
        event.preventDefault();
        const basket = event.currentTarget.querySelector(".basket");
        const input = document.getElementById(event.currentTarget.parentNode.getAttribute('for'));
        if (!basket.contains(event.target)) {
          input.checked = (event.currentTarget.classList.contains("active")) ? false : true;
          event.currentTarget.classList.toggle("active");
        } else {
          input.checked = true;
          if (!event.currentTarget.classList.contains("active")) {
            event.currentTarget.classList.toggle("active");
          }
        }

      });
    });
  };

  baskets.forEach((basket) => {
    basket.querySelectorAll('.increment').forEach((increment) => {
      increment.addEventListener('click', (e) => {
        const input = basket.querySelector('input');
        const quantityMax = parseInt(basket.dataset.maxValue, 10);
        if (e.currentTarget.classList.contains('minus')) {
          if (input.value > 0) {
            input.value = parseInt(input.value, 10) - 1;
            const plus = basket.querySelector('.increment.plus');
            if (plus.classList.contains('disabled')) {
              plus.classList.toggle('disabled');
            }
            if (e.currentTarget.classList.contains('disabled')) {
              e.currentTarget.classList.toggle('disabled')
            };
            const inputValue = parseInt(input.value, 10);
            if (inputValue === 0) {

              e.currentTarget.classList.toggle('disabled');
            }
          } else {
            e.currentTarget.classList.toggle('disabled');
          };
        } else {
          if (input.value < quantityMax) {
            input.value  = parseInt(input.value, 10) + 1
            const minus = basket.querySelector('.increment.minus');
            if (minus.classList.contains('disabled')) {
              minus.classList.toggle('disabled');
            }
            if (e.currentTarget.classList.contains('disabled')) {e.currentTarget.classList.toggle('disabled')};

          } else {
            e.currentTarget.classList.toggle('disabled');
          }
        }
      });
    })
  })

};

export{ initListGroupItemsAction };
