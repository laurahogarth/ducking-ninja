class @MapServices
  constructor: (element_selector) ->
    el = $(element_selector)[0]
    @renderer = new MapRenderer(el)

  render_uk_street: (postcode) ->
    geocoder_request =
      address: postcode
      region: "UK"
    map_options =
      show_marker: true
    @renderer.render_map(geocoder_request, map_options)

  render_country: (country_name) ->
    geocoder_request =
      region: country_name
      address: country_name
    map_options =
      mapTypeId: google.maps.MapTypeId.TERRAIN
    @renderer.render_map(geocoder_request, map_options)

  

