
class Api::V1::FoodEntriesController < ApplicationController

  def index
    food_entries = FoodEntry.all
    render json: FoodEntriesSerializer.new(food_entries)
  end

  def create
    food = Food.find(params[:food_id])
    fe = food.food_entries.new(time: params[:time])
    if fe.save
      render json: {'status': "Created #{food.name} entry at #{params[:time]}"},status: 201
    else
      render json: {'status': "Invalid entry"}, status: 400
    end
  end

  def update
    food_entry = FoodEntry.find(params[:id])
    if food_entry.update(food_entry_params)
      render json: {'status': "Updated food entry"},status: 201
    else
      render raw: "", status: 400
    end
  end

  def destroy
    begin
      FoodEntry.find(params[:id]).destroy
      render status: 204, json: {'status': "Record Deleted"}
    rescue
      render status: 404
    end
  end

  private

  def food_entry_params
    params.permit(:time, :food_id)
  end

end
