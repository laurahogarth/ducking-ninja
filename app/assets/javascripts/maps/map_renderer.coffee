class @MapRenderer

  DEFAULT_MAP_OPTIONS =
    mapTypeId: google.maps.MapTypeId.ROADMAP

  constructor: (el) ->
    @el = el

  render_map: (geocoder_request, map_options) ->
    self = @
    coder = new google.maps.Geocoder
    coder.geocode geocoder_request, (results, status) ->
      if status == google.maps.GeocoderStatus.OK
        latlng = results[0].geometry.location
        bounds = results[0].geometry.viewport
        map = new google.maps.Map(self.el, $.extend(DEFAULT_MAP_OPTIONS, map_options))
        map.setCenter(latlng)
        map.fitBounds(bounds)
        self.add_marker(map, latlng, map_options["marker_title"]) if map_options["show_marker"]

  add_marker: (map, latlng, title = "") ->
    marker = new google.maps.Marker
      position: latlng
      map: map
      title: title
