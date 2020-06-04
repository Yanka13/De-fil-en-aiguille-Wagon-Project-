import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('search');
  if (addressInput) {
    places({ container: addressInput }).configure({
     countries: ['fr'] // only search in the United States, the rest of the settings are unchanged: we're still searching for cities in German.
    });
  }
};

export { initAutocomplete };
