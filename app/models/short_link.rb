class ShortLink < ApplicationRecord
  ## Callbacks
  before_validation do
    self.full_url.downcase!
    generate_short_suffix
  end

  ## Validations
  validates :full_url,  presence: true, 
                        format: URI::regexp(%w[http https]),
                        uniqueness: true

  # case doesn't matter because uppercase is totally different than lowercase
  # i.e. ci.com/aBc != ci.com/abc
  validates :short_link, presence: true, 
                         uniqueness: true,
                         format: URI::regexp(%w[http https])


  ## Methods
  def generate_short_suffix
    lowercase_letters = "a".."z"
    uppercase_letters = "A".."Z"
    alphabet = lowercase_letters.zip(uppercase_letters).flatten # "a", "A", "b", "B", "c", "C", ..
    link_suffix = ""

    10.times do
      character_index = rand(0..51)
      character_to_add = alphabet[character_index]
      link_suffix = link_suffix + character_to_add
    end

    self.short_link = "https://ci.com/" + link_suffix
  end
end
