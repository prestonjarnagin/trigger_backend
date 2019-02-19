class Api::V1::DaySummaryController < ApplicationController

  def show
    #7*3600 is 7 hours worth of seconds. 7 a.m. in England and 12 a.m. in Denver
    begin_time_range = params[:date].to_i - (params[:date].to_i % 86400) +(7*3600)
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
