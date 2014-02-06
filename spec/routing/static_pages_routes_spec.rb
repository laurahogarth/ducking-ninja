describe StaticPagesController do

  describe "routing" do
    it "routes /about" do
      expect(:get => "/about").to route_to(:controller => "static_pages", :action => "about") 
    end
    it "routes /faq" do
      expect(:get => "/faq").to route_to(:controller => "static_pages", :action => "faq") 
    end
    it "routes /privacy" do
      expect(:get => "/privacy").to route_to(:controller => "static_pages", :action => "privacy") 
    end
    it "routes /terms" do
      expect(:get => "/terms").to route_to(:controller => "static_pages", :action => "terms") 
    end
  end
end
