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
        # tests these, but I often like to add some extra security & explicitness.
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
      it "is present" do
        fully_valid_short_link = ShortLink.new(full_url: "https://www.CustomInk.com", short_link: "https://ci.com/asdf")
        expect(fully_valid_short_link.save).to eq(true)
      end

      it "is unique" do
        base_shortlink = ShortLink.create!(full_url: "https://www.CustomInk.com/sitemap")
        another_shortlink = ShortLink.create!(full_url: "https://www.CustomInk.com")
        expect(base_shortlink.short_link).to_not eq(another_shortlink.short_link)
      end
    end
  end

  ## Callbacks
  context "before_validate" do
    it "downcases the full_url" do
      valid_shortlink = ShortLink.create!(full_url: "https://www.CustomInk.com/sitemap")
      expect(valid_shortlink.full_url).to eq("https://www.customink.com/sitemap")
      expect(valid_shortlink.full_url).to_not eq("https://www.CustomInk.com/sitemap")
    end
  end

  # Methods
  context "generate_short_suffix" do
    before(:each) do
      @shortlink = ShortLink.create!(full_url: "https://www.CustomInk.com/sitemap")
      @parsed_shortlink = URI.parse(@shortlink.short_link)
    end

    context "complete short_link" do
      it "starts with https://ci.com/" do
        expect(@shortlink.short_link[0..14]).to eq("https://ci.com/")
      end
    end

    context "short_link suffix" do
      it "is 10-characters" do
        # check that the suffix has 10 characters. be sure to strip off initial /
        expect(@parsed_shortlink.path[1..].size).to eq(10)
      end

      it "is only alpha characters" do
        suffix = @parsed_shortlink.path[1..]
        expect(suffix.match?(/\A[a-zA-Z'-]*\z/)).to eq(true)
      end
    end
  end
end
