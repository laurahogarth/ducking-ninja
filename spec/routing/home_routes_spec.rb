describe "Static Page Routes" do
  #Home Page
  specify { expect(:get => "/").to route_to(:controller => "home", :action => "index") }
  specify { expect(:get => "/home/index").not_to route_to(:controller => "home", :action => "index") }

 end
