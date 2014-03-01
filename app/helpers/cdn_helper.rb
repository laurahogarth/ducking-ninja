module CdnHelper

  CDNS = {
    :jsapi => "https://www.google.com/jsapi",
    :google_maps => "https://maps.googleapis.com/maps/api/js?sensor=true"
  }

  def include_cdn(cdn)
    javascript_include_tag CDNS[cdn]
  end

end
