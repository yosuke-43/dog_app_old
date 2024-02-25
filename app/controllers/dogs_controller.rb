class DogsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @displayed_dogs = Dog.where(display_in_index: 1)
    @displayed_dogs_pulldown = @displayed_dogs.order(breed: :asc).pluck(:breed).uniq
    @q = @displayed_dogs.ransack(params[:q])
    @dogs = @q.result(distinct: true).includes(:dog_size_type, :dog_country).order(breed: :asc) 
  end

  def show
    @dog = Dog.includes(:dog_size_type, :dog_country).find(params[:id])
  end
end
