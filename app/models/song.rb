class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :release_year}
    validates :released, inclusion: { in: [true, false]}
    validates :release_year, presence: true, if: :released_is_true, numericality: { less_than_or_equal_to: Time.now.year }
    validates :artist_name, presence: true

    def released_is_true
        self.released
    end
end