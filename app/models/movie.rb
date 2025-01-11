class Movie < ApplicationRecord
  validates :title, :overview, uniqueness: true
  validates :title, :overview, presence: true

  has_many :bookmarks
end
