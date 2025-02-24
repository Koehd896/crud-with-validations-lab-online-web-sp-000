class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:artist_name, :release_year] }
    # validates :release_year, presence: true, if: :released?
    # validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}
    end
    validates :artist_name, presence: true

    def released?
        released
    end
end
