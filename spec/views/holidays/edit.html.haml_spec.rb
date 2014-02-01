require 'spec_helper'

describe "holidays/edit" do
  before(:each) do
    @holiday = assign(:holiday, stub_model(Holiday,
      :country => 1,
      :region => "MyString",
      :nights => 1,
      :budget => 1.5,
      :ballpark? => false,
      :adults => 1,
      :children => 1,
      :travel? => false,
      :description => "MyText"
    ))
  end

  it "renders the edit holiday form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", holiday_path(@holiday), "post" do
      assert_select "input#holiday_country[name=?]", "holiday[country]"
      assert_select "input#holiday_region[name=?]", "holiday[region]"
      assert_select "input#holiday_nights[name=?]", "holiday[nights]"
      assert_select "input#holiday_budget[name=?]", "holiday[budget]"
      assert_select "input#holiday_ballpark?[name=?]", "holiday[ballpark?]"
      assert_select "input#holiday_adults[name=?]", "holiday[adults]"
      assert_select "input#holiday_children[name=?]", "holiday[children]"
      assert_select "input#holiday_travel?[name=?]", "holiday[travel?]"
      assert_select "textarea#holiday_description[name=?]", "holiday[description]"
    end
  end
end
