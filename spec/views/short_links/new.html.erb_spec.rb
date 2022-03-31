require 'rails_helper'

RSpec.describe "short_links/new", type: :view do
  before(:each) do
    assign(:short_link, ShortLink.new(
      full_url: "MyString",
      short_link: "MyString"
    ))
  end

  it "renders new short_link form" do
    render

    assert_select "form[action=?][method=?]", short_links_path, "post" do

      assert_select "input[name=?]", "short_link[full_url]"

      assert_select "input[name=?]", "short_link[short_link]"
    end
  end
end
