class Favorite < ApplicationRecord
  validates :ip, :presence => true
  validates :url, :presence => true, :uniqueness => {:scope => :ip}
  validates :shingle, :uniqueness => {:scope => [:ip, :color]}

  # Options are
  def self.add(url, ip, options = {})
    begin
      create!(options.merge(:url => url, :ip => ip))
    rescue => e
      if !e.message.match?("has already been taken")
        raise e
      end
    end
  end
end
