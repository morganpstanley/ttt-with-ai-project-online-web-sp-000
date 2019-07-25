class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts "                                            "
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts '-----------'
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts '-----------'
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "                                            "
  end

  def position(position)
    @cells[position.to_i-1]
  end

  def full?
  @cells.none?(" ")
  end

  def turn_count
    turns = 0
    @cells.each {|cell| turns += 1 if cell == "X" || cell == "O"}
    turns
  end

  def taken?(player_move)
  position(player_move) != " "
  end

  def valid_move?(move)
  move.to_i.between?(1, 9) && taken?(move) == false
  end

  def update(move, player)
  valid_move?(move) ? @cells[move.to_i-1] = player.token : nil
  end

end
