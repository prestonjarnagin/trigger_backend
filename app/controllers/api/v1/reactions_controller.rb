
class Api::V1::ReactionsController < ApplicationController

  def index
    reactions = Reaction.all
    render json: ReactionSerializer.new(reactions)
  end

  # def create
  #   if Reaction.create(name: params["name"])
  #     render status: 201, json:{"status": "Created #{params["name"]}"}
  #   else
  #     render status: 400
  #   end
  # end

  def create
    reaction = Reaction.new(name: params[:name])
    if reaction.save
      render json: {'status': "Created #{params[:name]}", 'id': reaction.id},status: 201
    elsif params[:name] == nil
      render json: {'status': "params are empty"}, status: 400
    else
      id = Reaction.find_by(name: params["name"].downcase.titleize).id
      render json: {'status': "#{params[:name]} is a duplicate", 'id': id}, status: 409
    end
  end

  def update

  end
end
