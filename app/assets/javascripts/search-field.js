var input = document.getElementById('city');
var options = {
  types: ['(cities)']
};
if (input) {
  autocomplete = new google.maps.places.Autocomplete(input, options);
}
