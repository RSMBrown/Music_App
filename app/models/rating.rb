class Rating < ApplicationRecord
    belongs_to :song, class_name: "Song", foreign_key: "song_id"
    validates :evaluation, presence: true, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 0 }
end
