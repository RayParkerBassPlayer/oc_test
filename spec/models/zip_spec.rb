require "rails_helper"

describe Zip do
  describe "structure and validation" do
    it "validates its fields" do
      # At present this allows case insensitive strings, so Canadian/Brit zips and the like are allowed.  This could be
      # tightened up if required.
      should validate_presence_of(:code)
      should validate_uniqueness_of(:code).case_insensitive
    end
  end
end
