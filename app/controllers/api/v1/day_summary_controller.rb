class Api::V1::DaySummaryController < ApplicationController

  def show

    begin_time_range = params[:date].to_i - (params[:date].to_i % 86400)
    end_time_range = begin_time_range + 86400
    foods = FoodEntry.where(time: begin_time_range..end_time_range)
    reactions = ReactionEntry.where(time: begin_time_range..end_time_range)
    values = foods + reactions

    sorted = values.sort_by do |object|
      object.time
    end
    render json: DaySummarySerializer.new(sorted)
  end

end
