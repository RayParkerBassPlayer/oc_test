require "rails_helper"

describe Favorite do
  describe "structure and validation" do
    it "validates its fields" do
      should validate_presence_of(:ip)
      should validate_presence_of(:url)
      should validate_uniqueness_of(:url).scoped_to(:ip)
      should validate_uniqueness_of(:shingle).scoped_to([:ip, :color])
    end
  end

  describe "favoriting", :vcr do
    it "stows an url and the favoriteer's ip" do
      favorite = build(:favorite)
      dp favorite
      expect{Favorite.add(favorite.url, favorite.ip, :shingle => favorite.shingle, :color => favorite.color)}.to change{Favorite.count}.by(1)
    end

    it "silently allows a duplicate like to be added, but not stored" do
      favorite = build(:favorite)

      expect{Favorite.add(favorite.url, favorite.ip, :shingle => favorite.shingle, :color => favorite.color)}.to change{Favorite.count}.by(1)
      expect{Favorite.add(favorite.url, favorite.ip, :shingle => favorite.shingle, :color => favorite.color)}.to change{Favorite.count}.by(0)
    end
  end
end
