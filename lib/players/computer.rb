require 'pry'

module Players

  class Computer < Player
    attr_reader :token

     def opponent_token
       @token == "X" ? "O" : "X"
     end

    def move(board)
      move = ""

      Game::WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] == @token && board.cells[combo[1]] == @token &&
          board.valid_move?((combo[2]+1).to_s)
            move = combo[2]
        end
        if move == "" && board.cells[combo[0]] == @token && board.cells[combo[2]] == @token &&
          board.valid_move?((combo[1]+1).to_s)
            move = combo[1]
        end
        if move == "" && board.cells[combo[1]] == @token && board.cells[combo[2]] == @token &&
          board.valid_move?((combo[0]+1).to_s)
            move = combo[0]
        end
      end

      if move == ""
        Game::WIN_COMBINATIONS.each do |combo|
          if board.cells[combo[0]] == opponent_token && board.cells[combo[1]] == opponent_token &&
            board.valid_move?((combo[2]+1).to_s)
            move = combo[2]
          end
          if move == "" && board.cells[combo[0]] == opponent_token && board.cells[combo[2]] == opponent_token &&
            board.valid_move?((combo[1]+1).to_s)
            move = combo[1]
          end
          if move == "" && board.cells[combo[1]] == opponent_token && board.cells[combo[2]] == opponent_token &&
            board.valid_move?((combo[0]+1).to_s)
            move = combo[0]
          end
        end
      end
      if move == ""
        until board.valid_move?("#{move}") == true
          move = (1..9).to_a.sample
        end
        move -= 1
      end
      sleep(1)
      (move+1).to_s
    end

  end
end
