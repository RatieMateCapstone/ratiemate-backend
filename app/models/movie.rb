class Movie < ApplicationRecord
    belongs_to :user
    validates :title, :genre, :image, :trailer, :rating, :description, :platform, :user_id, presence: true
    validates :title, uniqueness: true
end
