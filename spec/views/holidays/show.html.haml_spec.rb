require 'spec_helper'

describe "holidays/show" do
  before(:each) do
    @holiday = assign(:holiday, stub_model(Holiday,
      :country => 1,
      :region => "Region",
      :nights => 2,
      :budget => 1.5,
      :ballpark? => false,
      :adults => 3,
      :children => 4,
      :travel? => false,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Region/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
  end
end
