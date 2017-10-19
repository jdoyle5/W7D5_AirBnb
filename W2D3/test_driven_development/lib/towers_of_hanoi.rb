class TowersOfHanoi
  attr_accessor :tower1, :tower2, :tower3, :towers

  def initialize(size = 4)
    @tower1 = (1..size).map { |num| num }
    @tower2 = []
    @tower3 = []
    @towers = [@tower1, @tower2, @tower3]
  end

  def move(start, finish)
    start_tower = @towers[start - 1]
    end_tower = @towers[finish - 1]

    if start_tower.empty?
      raise 'Tower empty!'
    elsif end_tower.empty?
      end_tower.unshift(start_tower.shift)
    elsif start_tower.first > end_tower.first
      raise 'Cannot do this!'
    else
      end_tower.unshift(start_tower.shift)
    end
  end

  def prompt
    puts 'Please select a starting tower as a number.'
    start_tower = gets.chomp.to_i
    puts 'Please select an ending tower as a number.'
    end_tower = gets.chomp.to_i

    move(start_tower, end_tower)
  end

  def won?
    @tower1.empty? && (@tower2.empty? || @tower3.empty?)
  end
end
