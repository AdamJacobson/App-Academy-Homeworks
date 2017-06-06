require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    cups = Array.new(14) { %i(stone stone stone stone) }
    cups[13] = []
    cups[6] = []
    @cups = cups
  end

  def valid_move?(start_pos)
    if start_pos >= @cups.length || @cups[start_pos].empty?
      raise StandardError.new("Invalid starting cup")
    end
    true
  end

  def make_move(pos, current_player_name)
    if valid_move?(pos)
      in_hand = pick_up_stones(pos)

      until in_hand.empty?
        pos = (pos + 1) % 14

        if pos == 6
          @cups[pos] << in_hand.pop if current_player_name == @name1
        elsif pos == 13
          @cups[pos] << in_hand.pop if current_player_name == @name2
        else
          @cups[pos] << in_hand.pop
        end
      end
    end
    render
    next_turn(pos)
  end

  def pick_up_stones(pos)
    stones = @cups[pos]
    @cups[pos] = []
    stones
  end

  def next_turn(ending_cup_idx)
    if [6, 13].include? ending_cup_idx
      :prompt
    elsif @cups[ending_cup_idx].length > 1
      ending_cup_idx
    else
      :switch
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    if @cups[6].length > @cups[13].length
      @name1
    elsif @cups[6].length < @cups[13].length
      @name2
    else
      :draw
    end
  end
end
