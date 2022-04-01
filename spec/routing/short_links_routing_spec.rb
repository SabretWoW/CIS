require "rails_helper"

RSpec.describe ShortLinksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/short_links").to route_to("short_links#index")
    end

    it "routes to #create" do
      expect(post: "/short_links").to route_to("short_links#create")
    end

    it "routes to #destroy" do
      expect(delete: "/short_links/1").to route_to("short_links#destroy", id: "1")
    end
  end
end
