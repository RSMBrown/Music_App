class Song < ApplicationRecord
    belongs_to :album, inverse_of: :songs, class_name: "Album", foreign_key: "album_id"
    has_one :rating, dependent: :destroy
    validates :subject, presence: true 
    validates :rhythm, presence: true 
end
