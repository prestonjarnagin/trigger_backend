class Api::V1::FoodsController < ApplicationController

  def index
  end

  def create
    if Food.create(name: params[:name])
      render json: {'status': "Created #{params[:name]}"},status: 201
    else
      render status: 400
    end
  end

  def update

  end
end
