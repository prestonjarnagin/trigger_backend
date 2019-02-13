
class Api::V1::FoodEntriesController < ApplicationController

  def index
    # foods = Food.all
    # render json: FoodSerializer.new(foods)
  end

  def create
    food = Food.find(params[:food_id])
    if food.food_entries.create(time: params[:time])
      render json: {'status': "Created #{food.name} entry at #{params[:time]}"},status: 201
    else
      render status: 400
    end
  end

  def update

  end
end
