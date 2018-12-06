class Favorite < ApplicationRecord
  validates :ip, :presence => true
  validates :url, :presence => true, :uniqueness => {:scope => :ip}

  def self.add(url, ip)
    begin
      create!(:url => url, :ip => ip)
    rescue => e
      if e.message != "Validation failed: Url has already been taken"
        raise e
      end
    end
  end
end
