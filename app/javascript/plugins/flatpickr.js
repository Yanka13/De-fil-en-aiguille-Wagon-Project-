import flatpickr from "flatpickr";

const flatdate = () => {
  flatpickr(".datepicker", {dateFormat: "d-m-Y"})
};

export { flatdate };
