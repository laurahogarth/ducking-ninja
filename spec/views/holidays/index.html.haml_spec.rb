require 'spec_helper'

describe "holidays/index" do
  before(:each) do
    assign(:holidays, [
      stub_model(Holiday,
        :country => 1,
        :region => "Region",
        :nights => 2,
        :budget => 1.5,
        :ballpark? => false,
        :adults => 3,
        :children => 4,
        :travel? => false,
        :description => "MyText"
      ),
      stub_model(Holiday,
        :country => 1,
        :region => "Region",
        :nights => 2,
        :budget => 1.5,
        :ballpark? => false,
        :adults => 3,
        :children => 4,
        :travel? => false,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of holidays" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Region".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
