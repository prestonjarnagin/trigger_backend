class Api::V1::ReactionEntriesController < ApplicationController

  def index
    reaction_entries = ReactionEntry.all
    render json: ReactionEntrySerializer.new(reaction_entries)
  end

  def create
    begin
      re = ReactionEntry.new(reaction_id: params[:reaction_id])
      re.time = params[:time]
      if re.save!
        render json: {'status': "Entered reaction at #{params[:time]}"}, status: 201
      else
        render status: 400
      end
    end
  end

  def update
    if ReactionEntry.find(params[:id])
      entry = ReactionEntry.find(params[:id])
      entry.update!(reaction_entry_params)
      render status: 202, json: {'status': "Record Updated"}
    else
      render status: 404
    end
  end

  def destroy
    begin
      ReactionEntry.find(params[:id]).destroy
      render status: 202, json: {'status': "Record Deleted"}
    rescue
      render status: 404
    end
  end

  private

  def reaction_entry_params
    params.permit(:reaction_id, :time)
  end
end
