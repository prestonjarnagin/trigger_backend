class Api::V1::ReactionEntriesController < ApplicationController

  def index
    reaction_entries = ReactionEntry.all
    render json: ReactionEntrySerializer.new(reaction_entries)
  end

  def create
    begin
      re = ReactionEntry.new(reaction_id: params[:reaction_id])
      re.time = params[:time]
      re.save!
      render json: {'status': "Entered reaction at #{params[:time]}"}, status: 201
    rescue
      render status: 400
    end
  end

  def update
    if ReactionEntry.find(params[:id])
      entry = ReactionEntry.find(params[:id])
      entry.update!(time: params[:time])
      render status: 202, json: {'status': "Record Updated"}
    else
      render status: 404
    end
  end
end
