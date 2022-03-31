require 'rails_helper'

RSpec.describe "short_links/index", type: :view do
  before(:each) do
    assign(:short_links, [
      ShortLink.create!(
        full_url: "Full Url",
        short_link: "Short Link"
      ),
      ShortLink.create!(
        full_url: "Full Url",
        short_link: "Short Link"
      )
    ])
  end

  it "renders a list of short_links" do
    render
    assert_select "tr>td", text: "Full Url".to_s, count: 2
    assert_select "tr>td", text: "Short Link".to_s, count: 2
  end
end
