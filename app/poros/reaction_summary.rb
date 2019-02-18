class ReactionSummary

  attr_reader :id,
              :name,
              :frequency

  def initialize(id, name, frequency)
    @id = id
    @name = name
    @frequency = frequency
  end

end
