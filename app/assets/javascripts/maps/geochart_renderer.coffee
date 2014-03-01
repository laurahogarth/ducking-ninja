class @GeochartRenderer
  
  DEFAULT_GEOCHART_OPTIONS =
    legend: "none"

  constructor: (el, rawdata) ->
    @el = document.getElementById(el)
    @raw_data = rawdata

  render_geochart: ->
    self = @

    regionClickHandler = (data) =>
      window.location = "agent/countries/" + data.region + "/holidays"

    drawGeoChart = (data) ->
      chart = new google.visualization.GeoChart(self.el)
      chart.draw(data, DEFAULT_GEOCHART_OPTIONS)
      google.visualization.events.addListener(chart, 'regionClick', regionClickHandler)

    data = google.visualization.arrayToDataTable self.raw_data
    
    google.setOnLoadCallback ->
      drawGeoChart data


