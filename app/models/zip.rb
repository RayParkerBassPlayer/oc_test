class Zip < ApplicationRecord
  self.primary_key = "code"
  validates :code, :presence => true, :uniqueness => true, :case_sensitive => false
end
