require 'rails_helper'

RSpec.describe "short_links/edit", type: :view do
  before(:each) do
    @short_link = assign(:short_link, ShortLink.create!(
      full_url: "MyString",
      short_link: "MyString"
    ))
  end

  it "renders the edit short_link form" do
    render

    assert_select "form[action=?][method=?]", short_link_path(@short_link), "post" do

      assert_select "input[name=?]", "short_link[full_url]"

      assert_select "input[name=?]", "short_link[short_link]"
    end
  end
end
