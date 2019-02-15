class Api::V1::FoodsController < ApplicationController

  def index
    foods = Food.all
    render json: FoodSerializer.new(foods)
  end

  def create
    food = Food.new(name: params[:name])
    if food.save
      render json: {'status': "Created #{params[:name]}", 'id': food.id},status: 201
    elsif params[:name] == nil
      render json: {'status': "params are empty"}, status: 400
    else
      id = Food.find_by(name: params["name"].downcase.titleize).id
      render json: {'status': "#{params[:name]} is a duplicate", 'id': id}, status: 409
    end
  end

  def update

  end

end
