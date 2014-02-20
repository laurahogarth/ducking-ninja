class @MapServices
  @render_map:(element_selector, address, region = "UK", zoom_level = 14, show_marker = false) ->
    address = region if address == ""
    element = $(element_selector)[0]
    coder = new google.maps.Geocoder
    geocoder_params =
      address: address
      region: region

    coder.geocode geocoder_params, (results, status) ->
      if status == google.maps.GeocoderStatus.OK
        latlng = results[0].geometry.location

        map_options =
          center: latlng
          zoom: zoom_level
          mapTypeId: google.maps.MapTypeId.ROADMAP

        map = new google.maps.Map(element, map_options)

        marker = new google.maps.Marker
          position: latlng
          map: map
          visible: show_marker

