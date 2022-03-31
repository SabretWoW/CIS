require "rails_helper"

RSpec.describe ShortLinksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/short_links").to route_to("short_links#index")
    end

    it "routes to #new" do
      expect(get: "/short_links/new").to route_to("short_links#new")
    end

    it "routes to #show" do
      expect(get: "/short_links/1").to route_to("short_links#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/short_links/1/edit").to route_to("short_links#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/short_links").to route_to("short_links#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/short_links/1").to route_to("short_links#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/short_links/1").to route_to("short_links#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/short_links/1").to route_to("short_links#destroy", id: "1")
    end
  end
end
