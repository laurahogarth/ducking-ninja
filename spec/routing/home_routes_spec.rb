describe "Static Page Routes" do
  #Home Page
  specify { expect(:get => "/").to route_to(:controller => "home", :action => "index") }
  specify { expect(:get => "/home/index").not_to route_to(:controller => "home", :action => "index") }

  #Other Static Pages
  specify { expect(:get => "/about").to route_to(:controller => "home", :action => "about") }
  specify { expect(:get => "/faq").to route_to(:controller => "home", :action => "faq") }
  specify { expect(:get => "/privacy").to route_to(:controller => "home", :action => "privacy") }
  specify { expect(:get => "/terms").to route_to(:controller => "home", :action => "terms") }
 end
