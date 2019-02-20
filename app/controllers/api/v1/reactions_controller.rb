
class Api::V1::ReactionsController < ApplicationController

  def index
    reactions = Reaction.all
    render json: ReactionSerializer.new(reactions)
  end

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

  def show
    reaction = Reaction.find(params[:id])
    reaction = {name: reaction.name, foods: reaction.foods, occurrences: reaction.occurrences}
    render json: ReactionSummarySerializer.new(reaction).json
  end
end
