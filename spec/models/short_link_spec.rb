require 'rails_helper'

RSpec.describe ShortLink, type: :model do
  it "has a valid factory" do
    short_link = build :short_link
    expect(short_link).to be_valid
  end

  ## Validations
  describe "validations" do
    describe "full_url" do
      it "is present" do
        new_shortlink = ShortLink.new(full_url: "https://www.CustomInk.com")
        expect(new_shortlink.save).to eq(true)

        empty_full_url = ShortLink.new(full_url: "")
        expect(empty_full_url.save).to eq(false)
      end

      it "is unique" do
        base_shortlink = ShortLink.create!(full_url: "https://www.CustomInk.com")
        duplicate_shortlink = ShortLink.new(full_url: "https://www.CustomInk.com")
        expect(duplicate_shortlink.save).to eq(false)

        unique_shortlink = ShortLink.create!(full_url: "https://www.CustomInk.com/products")
        expect(unique_shortlink.save).to eq(true)
      end

      it "is a valid url" do
        valid_https_shortlink = ShortLink.new(full_url: "https://www.CustomInk.com")
        expect(valid_https_shortlink.save).to eq(true)
        valid_http_shortlink = ShortLink.new(full_url: "http://www.CustomInk.com")
        expect(valid_http_shortlink.save).to eq(true)

        # Test some of the most likely invalid URL inputs. The URI::regexp probably already 
        # tests these, but I like to add some extra security sometimes.
        invalid_shortlink = ShortLink.new(full_url: "www.CustomInk")
        expect(invalid_shortlink.save).to eq(false)

        invalid_shortlink = ShortLink.new(full_url: "CustomInk")
        expect(invalid_shortlink.save).to eq(false)

        invalid_shortlink = ShortLink.new(full_url: "telnet://www.CustomInk.com")
        expect(invalid_shortlink.save).to eq(false)

        invalid_shortlink = ShortLink.new(full_url: "ftp://www.CustomInk.com")
        expect(invalid_shortlink.save).to eq(false)
      end
    end

    describe "short_link" do 
      xit { expect(short_link).to validate_presence_of(:short_link) }
      xit { expect(short_link).to validate_uniqueness_of(:short_link) }
      xit { expect(short_link).to format(:short_link) } # TODO: figure this out
    end
  end

  ## Callbacks
  # TODO
end

