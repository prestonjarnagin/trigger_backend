class ReactionSummarySerializer

  def initialize(reaction_summary_data)
    @reaction_summary_data = reaction_summary_data
  end

  def json
    {
      name: @reaction_summary_data[:name],
      foods: @reaction_summary_data[:foods],
      occurrences: @reaction_summary_data[:occurrences]
    }
  end

end
