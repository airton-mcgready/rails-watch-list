class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, uniqueness: true, presence: true

  #   has_many :bookmarks, dependent: :destroy
  # has_many :movies, through: :bookmarks, dependent: :destroy

  # validates :name, presence: true, uniqueness: true
end
