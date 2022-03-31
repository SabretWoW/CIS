require 'rails_helper'

RSpec.describe "short_links/show", type: :view do
  before(:each) do
    @short_link = assign(:short_link, ShortLink.create!(
      full_url: "Full Url",
      short_link: "Short Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Url/)
    expect(rendered).to match(/Short Link/)
  end
end
