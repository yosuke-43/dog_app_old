class DogsController < ApplicationController
  def index
    @dogs = Dog.all.includes(:dog_size_type).order(dog_size_type_id: :asc)
  end

  def show
  end
end
