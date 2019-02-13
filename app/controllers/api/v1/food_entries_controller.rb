
class Api::V1::FoodEntriesController < ApplicationController

  def index
    # foods = Food.all
    # render json: FoodSerializer.new(foods)
  end

  def create
    food = Food.find(params[:food_id])
    time = DateTime.strptime(params[:created_at],'%s')
    if food.food_entries.create(created_at: time)
      render json: {'status': "Created #{food.name} entry at #{params[:created_at]}"},status: 201
    else
      render status: 400
    end
  end

  def update

  end
end
