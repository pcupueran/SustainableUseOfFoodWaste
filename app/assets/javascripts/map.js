var map;
var bounds;

function initMap() {
  console.log("Google maps has now loaded!");

  var charity = $('#map-canvas').data('charity');

  map = new google.maps.Map(document.getElementById('map-canvas'), {
    center: {lat: parseFloat(charity.latitude), lng: parseFloat(charity.longitude)},
    zoom: 8
  });

  bounds = new google.maps.LatLngBounds();

  addMarkers([charity]);

  var providers = $('#map-canvas').data('providers');
  addMarkers(providers);

}

function createMarker(user) {
  var latLng = new google.maps.LatLng(user.latitude, user.longitude);
  var marker = new google.maps.Marker({
  position: latLng,
  organizationName: user.organizationName,
  email: user.email,
  address: user.address,
  map: map
  });
  return marker;
}
function addMarkers(users) {
  _(users).each(function(user){
    var marker = createMarker(user);
    marker.setMap(map);
    changeBoundsMap(bounds, marker, map);
    markerInformation(marker, map);
  });
}

function changeBoundsMap(bounds, marker, map){
  bounds.extend(marker.position);
  map.fitBounds(bounds);
}

function markerInformation(marker, map){
  var markerInfo = '<h3>' + marker.organizationName + '</h3><ul>' +
                        '<li>' + marker.email + '</li>' +
                        '<li>' + marker.address + '</li></ul>';

  var infowindow = new google.maps.InfoWindow({
    content: markerInfo
  });

  marker.addListener('mouseover', function() {
    infowindow.open(map, marker);
  });

  marker.addListener('mouseout', function() {
    infowindow.close(map, marker);
  });
}
