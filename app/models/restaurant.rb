class Restaurant < ApplicationRecord
  has_many :crawls
  belongs_to :neighborhood
  has_many :reviews
end
