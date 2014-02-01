describe "Static Page Routes" do
  #Other Static Pages
  specify { expect(:get => "/about").to route_to(:controller => "static_pages", :action => "about") }
  specify { expect(:get => "/faq").to route_to(:controller => "static_pages", :action => "faq") }
  specify { expect(:get => "/privacy").to route_to(:controller => "static_pages", :action => "privacy") }
  specify { expect(:get => "/terms").to route_to(:controller => "static_pages", :action => "terms") }
end
