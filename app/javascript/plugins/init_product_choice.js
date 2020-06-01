const initProductChoice = () => {
  const listProducts = document.querySelectorAll(".product-choice");
  if (listProducts) {
    listProducts.forEach((product) => {
      product.addEventListener("click", (event) => {
        listProducts.forEach((product) => {
          product.classList.remove("active");
        });
        event.currentTarget.classList.add("active");
      });
    });
  };
};

export{ initProductChoice };
