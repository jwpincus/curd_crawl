class Review < ApplicationRecord
  # scope :ordered_most_recent, -> { order(created_at: :desc)}
  default_scope { order(created_at: :desc)}

  # def self.ordered_most_recent
  #   order(created_at: :desc)
  # end
end
