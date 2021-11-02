class StudiosController < ApplicationController
  def index
      @studios = Studio.all
    end

  def show
    @studio = Studio.find(params[:id])
  end
  #
  # def new
  # end
  #
  # def create
  #   shelter = Shelter.new(shelter_params)
  #
  #   if shelter.save
  #     redirect_to '/shelters'
  #   else
  #     redirect_to '/shelters/new'
  #     flash[:alert] = "Error: #{error_message(shelter.errors)}"
  #   end
  # end
  #
  # def edit
  #   @shelter = Shelter.find(params[:id])
  # end
  #
  # def update
  #   shelter = Shelter.find(shelter_params[:id])
  #   if shelter.update(shelter_params)
  #     redirect_to '/shelters'
  #   else
  #     redirect_to "/shelters/#{shelter.id}/edit"
  #     flash[:alert] = "Error: #{error_message(shelter.errors)}"
  #   end
  # end
  #
  # def destroy
  #   shelter = Shelter.find(params[:id])
  #   shelter.destroy
  #   redirect_to '/shelters'
  # end

  private

  def studio_params
    params.permit(:id)
  end
end
