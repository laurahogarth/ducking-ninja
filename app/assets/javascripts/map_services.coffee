class @MapServices
  constructor: (element_selector) ->
    @el = $(element_selector)[0]
    console.log @el
    @map = null

  render_uk_street: (postcode) ->
    geocoder_options =
      address: postcode
      region: "UK"
    map_options =
      zoom: 15
    @_render_map(geocoder_options, map_options, true)


  render_country: (country_name) ->
    geocoder_options =
      address: country_name
    map_options =
      zoom: 5
    @_render_map(geocoder_options, map_options)

  
  #
  # Main Map Rendering Code Below
  #

  _render_map: (geocoder_options, map_options, add_marker = false) ->
    self = @
    coder = new google.maps.Geocoder
    coder.geocode geocoder_options, (results, status) ->
      if status == google.maps.GeocoderStatus.OK
        latlng = results[0].geometry.location

        default_options =
          mapTypeId: google.maps.MapTypeId.ROADMAP
          center: latlng

        @map = new google.maps.Map(self.el, $.extend(map_options, default_options))

        if add_marker
          marker = new google.maps.Marker
            position: latlng
            map: @map



