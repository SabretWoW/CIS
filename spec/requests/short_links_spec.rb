require 'rails_helper'

RSpec.describe "/short_links", type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      ShortLink.create! valid_attributes
      get short_links_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ShortLink" do
        expect {
          post short_links_url, params: { short_link: valid_attributes }
        }.to change(ShortLink, :count).by(1)
      end

      it "redirects to the created short_link" do
        post short_links_url, params: { short_link: valid_attributes }
        expect(response).to redirect_to(short_link_url(ShortLink.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ShortLink" do
        expect {
          post short_links_url, params: { short_link: invalid_attributes }
        }.to change(ShortLink, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post short_links_url, params: { short_link: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested short_link" do
      short_link = ShortLink.create! valid_attributes
      expect {
        delete short_link_url(short_link)
      }.to change(ShortLink, :count).by(-1)
    end

    it "redirects to the root_path list" do
      short_link = ShortLink.create! valid_attributes
      delete short_link_url(short_link)
      expect(response).to redirect_to(root_path)
    end
  end
end
