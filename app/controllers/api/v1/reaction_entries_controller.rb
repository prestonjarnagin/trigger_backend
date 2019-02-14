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
end
