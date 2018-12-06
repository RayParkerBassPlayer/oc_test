require "rails_helper"

describe Favorite do
  describe "structure and validation" do
    it "validates its fields" do
      should validate_presence_of(:ip)
      should validate_presence_of(:url)
      should validate_uniqueness_of(:url).scoped_to(:ip)
    end
  end

  describe "favoriting" do
    it "stows an url and the favoriteer's ip" do
      ip = Faker::Internet.ip_v4_address
      url = Faker::Internet.url

      expect{Favorite.add(url, ip)}.to change{Favorite.count}.by(1)
    end

    it "silently allows a duplicate like to be added, but not stored" do
      ip = Faker::Internet.ip_v4_address
      url = Faker::Internet.url

      expect{Favorite.add(url, ip)}.to change{Favorite.count}.by(1)
      expect{Favorite.add(url, ip)}.to change{Favorite.count}.by(0)
    end
  end
end
