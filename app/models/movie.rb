class Movie < ApplicationRecord
  has_many :bookmarks

validates :title, presence: true, uniqueness: true
validates :overview, presence: true

  #  has_many :bookmarks
  # has_many :lists, through: :bookmarks

  # before_destroy :no_bookmarks

  # validates :title, presence: true, uniqueness: true
  # validates :overview, presence: true
  # validates :poster_url, presence: true
  # validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }


#   private

#   def no_bookmarks
#     if bookmarks.any?
#       errors.add(:base, "Can't delete a movie when there's an associated bookmark")
#       throw :abort
# end
# end
end
