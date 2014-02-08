describe Agent::HomeController do
  describe "routing" do
    it "routes /" do
      expect(:get => "/agent").to route_to(:controller => "agent/home", :action => "index") 
    end

    it "does not route vanilla /home/index path" do
      expect(:get => "/agent/home/index").not_to route_to(:controller => "agent/home", :action => "index")
    end
  end
end
