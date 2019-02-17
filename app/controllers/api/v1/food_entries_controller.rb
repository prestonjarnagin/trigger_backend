
class Api::V1::FoodEntriesController < ApplicationController

  def index
    food_entries = FoodEntry.all
    render json: FoodEntriesSerializer.new(food_entries)
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
    food_entry = FoodEntry.find(params[:id])
    if food_entry.update(time: params[:time])
      render json: {'status': "Updated food entry #{food_entry.id} time to #{food_entry.time}"},status: 201
    else
      render status: 400
    end
  end

  def destroy
    FoodEntry.delete(params[:id])
    render status: 204, body: ""
  end
end
