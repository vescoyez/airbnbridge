var cityInput = document.getElementById('city');
var addressInput = document.getElementById('bridge_address');

if (cityInput) {
  autocomplete = new google.maps.places.Autocomplete(cityInput, {
    types: ['(cities)']
  });
}

if (addressInput) {
  autocomplete = new google.maps.places.Autocomplete(addressInput, {
    types: ['address']
  });
}
