class ActorMoviesController < ApplicationController

  def create
    actor = Actor.where("lower(name) like ?", "%#{params[:name].downcase}%")
    if actor.any?
      ActorMovie.create({movie_id: (params[:id]), actor_id: (actor.first.id)})
      redirect_to "/movies/#{params[:id]}"
    else
      redirect_to "/movies/#{params[:id]}"
    end
  end
end
