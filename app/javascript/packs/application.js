// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initSelect2 } from '../components/init_select2';
import { flatdate } from "../plugins/flatpickr"
import { initCalendarDisplay } from '../plugins/init_calendar_display';
import { initListGroupItemsAction } from '../plugins/init_list_group_items_action';
import { initProjectCable } from '../channels/project_channel';
import { initProductChoice } from '../plugins/init_product_choice';
import { initCounterOffers } from '../plugins/init_counter_offers';
// import { initProgressBar } from '../components/init_progressbar';

document.addEventListener('turbolinks:load', () => {
  initSelect2();
  initAutocomplete();
  initCalendarDisplay();
  initListGroupItemsAction();
  flatdate();
  initProjectCable();
  initProductChoice();
  initCounterOffers();
  // initProgressBar();
  $(function() {
    // Sidebar toggle behavior
    $('#sidebarCollapse').on('click', function() {
      $('#sidebar, #content').toggleClass('active');
    });
  });
  initMapbox();
})

