
jQuery(document).ready(function($) {
  
  // This disable submiting the form with the ENTER key only for inputs and selects
  $('input,select').keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });

});



$('.clear-btn').click(function() {


  var form = document.forms[0];

 // form.reset();
 // console.log(form.elements);
 var form_elements = form.elements;
 for (i=0; i<form_elements.length; i++){
  if (form_elements[i].className == "loc_data"){
    form_elements[i].readOnly = false;
    switch (form_elements[i].id) 
    {
      case "location_country":
        form_elements[i].value = "US";
        break;
      default:
        form_elements[i].value = "";
        break;
    }
  }
 }

})

  var defaultZoom = 4; // Why zoomed in? Because it looks good.
  
  // create map and add controls
  var mapOptions = {
    center: new google.maps.LatLng(37, -95),
    zoom: defaultZoom,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    scrollwheel: false,
    scaleControl: true
  };
  var map = new google.maps.Map(document.getElementById('googlemap'),mapOptions);

  // I'm Centering the map in Bangkok
  // '13.731547730050778'
  // '100.56798934936523'
  var mylat = document.getElementById("location_latitude").value;
  var mylng = document.getElementById("location_longitude").value;
  if (jQuery.isEmptyObject(mylat)) {
    var mylat = '37';
    var mylng = '-95';
    var defaultZoom = 4;
  };

  // set center point of map to be of the Marker or the Default City
  var centrePoint = new google.maps.LatLng(mylat, mylng);
  map.setCenter(centrePoint);
  map.setZoom(defaultZoom); 

  // add a draggable marker
  marker = new google.maps.Marker({
    map: map,
    draggable: true,
    animation: google.maps.Animation.DROP,
    position: centrePoint
  });

  var defaultImage = new google.maps.MarkerImage(
      "http://maps.gstatic.com/mapfiles/place_api/icons/geocode-71.png",
      new google.maps.Size(71, 71),
      new google.maps.Point(0, 0),
      new google.maps.Point(17, 34),
      new google.maps.Size(35, 35));
  marker.setIcon(defaultImage);

  google.maps.event.addListener(marker, 'click', toggleBounce);

  // create Info window for marker
  var infowindow = new google.maps.InfoWindow();
  
  // Address Autocomplete
  var input = document.getElementById('location_search');
  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.bindTo('bounds', map);
  
  // add a drag listener to the map
  google.maps.event.addListener(marker, "dragend", function() {
    var point = marker.getPosition();
    map.panTo(point);
    document.getElementById("location_latitude").value = Math.round(point.lat()*100000)/100000;
    document.getElementById("location_longitude").value = Math.round(point.lng()*100000)/100000;
    infowindow.close();
    marker.setIcon(defaultImage);
  });
  var place;
  var photos;

  // Autocomplete Listener
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    place = autocomplete.getPlace();
    // console.log(place);
    // console.log(place.address_components);
    marker.setPosition(place.geometry.location);
    map.panTo(place.geometry.location);
    map.setZoom(16);

    var loc_fields = $('.loc_data');
    for (var i = 0; i < loc_fields.length; i++) {
        loc_fields[i].value='';
    }

    document.getElementById("location_latitude").value = Math.round(place.geometry.location.lat()*100000)/100000;
    // document.getElementById("location_latitude").readOnly = true;
    document.getElementById("location_longitude").value = Math.round(place.geometry.location.lng()*100000)/100000;
    // document.getElementById("location_longitude").readOnly = true;
    document.getElementById("location_name").value = place.name;

    // console.log(place);

    // Sets the proper image on the marker. ie. school/hospital marker
    var image = new google.maps.MarkerImage(
        place.icon,
        new google.maps.Size(71, 71),
        new google.maps.Point(0, 0),
        new google.maps.Point(17, 34),
        new google.maps.Size(35, 35));
    marker.setIcon(image);
    marker.setPosition(place.geometry.location);

    var address = '';
    var new_address = {};

    for (var i in place.address_components) {
      for (var j in place.address_components[i]['types']) {
        new_address[place.address_components[i]['types'][j]] = {
        'long_name' : place.address_components[i].long_name,
        'short_name' : place.address_components[i].short_name
        };
      }
    }

    if (place.address_components) {
      address = [(place.address_components[0] &&
                  place.address_components[0].short_name || ''),
                 (place.address_components[1] &&
                  place.address_components[1].short_name || ''),
                 (place.address_components[2] &&
                  place.address_components[2].short_name || '')
                ].join(' ');
    }

    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
    infowindow.open(map, marker);
    
    // Autofill the fields in the form. TODO: improve parsing of the returned JSON data.
    var address = place.address_components;
    var website = place.url;



    // if (address[address.length - 1]) {
    //   var zipcode = address[address.length - 1].long_name;
    // };
    // if (address[address.length - 2]) {
    //   var country = address[address.length - 2].long_name;
    // };
    // if (address[address.length - 3]) {
    //   var city = address[address.length - 3].long_name;
    // };
    // if (address[address.length - 4]) {
    //   var sublocality = address[address.length - 4].long_name;
    // };
    // if (address[0]) {
    //   var streetnumber = address[0].long_name;
    //   var street_address_1 = address[0].long_name + ' ' + address[1].long_name;
    // };
    // if (address[1]) {
    //   var streetname = address[1].long_name;
    // };
    // if (place.name) {
    //   var location_name = JSON.stringify(place.name);
    // }
    
    var formatted_address = place.formatted_address;
    var formatted_phone_number = place.formatted_phone_number;




    if (new_address.postal_code){
      document.getElementById("location_zip").value = new_address.postal_code.long_name//zipcode;
      // document.getElementById("location_zip").readOnly = true;
    }
    if (new_address.locality) {
      document.getElementById("location_city").value = new_address.locality.long_name;
      // document.getElementById("location_city").readOnly = true;
    } else if (new_address.administrative_area_level_3) {
      document.getElementById("location_city").value = new_address.administrative_area_level_3.long_name;
      // document.getElementById("location_city").readOnly = true;
    } else if (new_address.sublocality) {
      document.getElementById("location_city").value = new_address.sublocality.long_name;
      // document.getElementById("location_city").readOnly = true;
    }
    if (new_address.administrative_area_level_1) {
      document.getElementById("location_state").value = new_address.administrative_area_level_1.short_name;
      // document.getElementById("location_state").readOnly = true;
    }
    if (place.website) {
      document.getElementById("location_website").value = place.website;
    }
    if (place.url) {
      document.getElementById("location_maplink").value = place.url;
      // document.getElementById("location_maplink").readOnly = true;
    }
    if (new_address.subpremise || new_address.floor || new_address.post_box || new_address.room) {
      var address_2 = [];
      if (new_address.floor) {
        // address_2 = address_2 + 'Floor ' + new_address.subpremise;
        address_2.push('Floor ' + new_address.floor.long_name);
      }
      if (new_address.room) {
        // address_2 = address_2 + 'Floor ' + new_address.subpremise;
        address_2.push('Room ' + new_address.room.long_name);
      }
      if (new_address.subpremise) {
        // address_2 = address_2 + 'Floor ' + new_address.subpremise;
        address_2.push('#' + new_address.subpremise.long_name);
      }
      if (new_address.post_box) {
        // address_2 = address_2 + 'Floor ' + new_address.subpremise;
        address_2.push('Box ' + new_address.post_box.long_name);  
      }
      document.getElementById("location_address2").value = address_2.join(' ');
      // document.getElementById("location_address2").readOnly = true;
    }
    if (new_address.country) {
      document.getElementById("location_country").value = new_address.country.short_name;
      document.getElementById("location_country").readOnly = true;
    }
    if (new_address.route) {
      if (new_address.street_number) {
        document.getElementById("location_address").value = new_address.street_number.long_name + ' ' + new_address.route.long_name;
        // document.getElementById("location_address").readOnly = true;
      } else {
        document.getElementById("location_address").value = new_address.route.long_name;
        // document.getElementById("location_address").readOnly = true;
      }
      // document.getElementById("location_address").value = street_address_1;
    } else if (new_address.intersection) {
      document.getElementById("location_address").value = new_address.intersection.long_name;
      // document.getElementById("location_address").readOnly = true;
    }
    // if (place.name) {
    //   document.getElementById("location_name").value = place.name;
    // }
    if (formatted_phone_number) {
      document.getElementById("location_phone").value = formatted_phone_number;
    }


    
    // if (zipcode){
    //   document.getElementById("location_zip").value = place.address_components['postal_code']//zipcode;
    // }
    // if (city) {
    //   document.getElementById("location_city").value = city;
    // }
    // if (country) {
    //   document.getElementById("location_country").value = country;
    // }
    // if (sublocality) {
    //   document.getElementById("location_state").value = sublocality;
    // }
    // if (sublocality) {
    //   // document.getElementById("location_address2").value = address.long_name.join();
    // }
    // if (streetname) {
    //   document.getElementById("location_address").value = street_address_1;
    // }
    // if (location_name) {
    //   document.getElementById("location_name").value = location_name;
    // }
    // if (formatted_phone_number) {
    //   document.getElementById("location_phone").value = formatted_phone_number;
    // }
    // photos = place.photos;
    // $('#place_images').empty();
    // for (var i = 0; i < photos.length; i++) {
    //   var url = photos[i].getUrl({maxHeight: "1280", maxWidth: "1280"});
    //   $('#place_images').prepend('<img src="' + url + '"/>');
    // }
  });
  
  // This is the function to animate the marker after dropping it.
  function toggleBounce() {
    if (marker.getAnimation() != null) {
      marker.setAnimation(null);
    } else {
      marker.setAnimation(google.maps.Animation.BOUNCE);
    }
  };

// for testing - to inspect the place object contents
function xinspect(o,i){
    if(typeof i=='undefined')i='';
    if(i.length>50)return '[MAX ITERATIONS]';
    var r=[];
    for(var p in o){
        var t=typeof o[p];
        r.push(i+'"'+p+'" ('+t+') => '+(t=='object' ? 'object:'+xinspect(o[p],i+'  ') : o[p]+''));
    }
    return r.join(i+'\n');
}