class Card
attr_reader :value
attr_accessor :orientation

  def initialize(value)
    @value = value
    @orientation = :down
  end

  def hide
    @orientation = :down
  end

  def reveal
    @orientation = :up
  end

  def to_s
    @value
  end

  def ==(second_object)
    self.value == second_object.value
  end

end
