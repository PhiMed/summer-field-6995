class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actors
    actors = Actor.find(Movie.where(id: "#{self.id}").joins(:actor_movies).pluck(:actor_id))
    @actors = Actor.where(id: actors.map(&:id))
  end

  def actors_young_to_old
    actors.order(:age)
  end

  def average_actor_age
    actors.average(:age)
  end

end
