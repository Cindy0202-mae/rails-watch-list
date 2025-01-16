class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  has_many :bookmarks
  has_many :lists, through: :bookmarks

  before_destroy :check_for_bookmarks

  # private

  # def check_for_bookmarks
  #   if bookmarks.any?
  #     errors.add(:base, 'Cannot delete movie with bookmarks')
  #     throw(:abort)
  #   end
  # end
end
