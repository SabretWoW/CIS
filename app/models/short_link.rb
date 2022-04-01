class ShortLink < ApplicationRecord
  ## Callbacks
  before_validation do
    self.full_url.downcase!
  end

  ## Validations
  validates :full_url,  presence: true, 
                        format: URI::regexp(%w[http https])
                        uniqueness: true  # since we downcase it before validations are run. 

  # case doesn't matter because uppercase is totally different than lowercase
  # i.e. ci.com/aBc != ci.com/abc
  validates :short_link, presence: true, 
                         uniqueness: true,
                         format: URI::regexp(%w[http https])
end
