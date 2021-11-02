class Studio < ApplicationRecord
  has_many :movies

  def movies
    Movie.where(studio_id: self.id)
  end


end
