module Players

  class Human < Player
    attr_reader :token

    def move(board)
      puts "Please input a move:"
      input = gets.strip
      input
    end
  end
end
