class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actors
    Actor.find(Movie.where(id: "#{self.id}").joins(:actor_movies).pluck(:actor_id))
  end

  def actors_young_to_old
    actors.sort_by {|a| a.age }
  end

  def average_actor_age
    if actors.any?
      (actors.pluck(:age).sum)/actors.count
    end
  end

end
