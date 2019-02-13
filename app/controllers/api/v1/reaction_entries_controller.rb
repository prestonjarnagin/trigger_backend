class Api::V1::ReactionEntriesController < ApplicationController

  def index
    reaction_entries = ReactionEntry.all
    render json: ReactionEntrySerializer.new(reaction_entries)
  end

end
