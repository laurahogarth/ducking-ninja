
describe HomeController do
  describe "routing" do
    it "routes /" do
      expect(:get => "/").to route_to(:controller => "home", :action => "index") 
    end

    it "does not route vanilla /home/index path" do
      expect(:get => "/home/index").not_to route_to(:controller => "home", :action => "index")
    end
  end
end
