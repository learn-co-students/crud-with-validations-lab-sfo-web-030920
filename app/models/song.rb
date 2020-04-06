class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: %i[release_year artist_name] }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released?, numericality: { less_than_or_equal_to: Date.current.year }

  def released?
    released
  end
end

# title, a string
# Must not be blank
# Cannot be repeated by the same artist in the same year
# released, a boolean describing whether the song was ever officially released.
# Must be true or false
# release_year, an integer
# Optional if released is false
# Must not be blank if released is true
# Must be less than or equal to the current year
# artist_name, a string
# Must not be blank
# genre,
