class Album < ApplicationRecord
    belongs_to :artist, class_name: "Artist", foreign_key: "artist_id"
    has_many :songs, dependent: :destroy 
    validates :title, presence: true 
    validates :genre, presence: true 
    validates :release, presence: true 
end
