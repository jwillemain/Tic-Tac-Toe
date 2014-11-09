# draw board
# decide who begins first comp vs player
# player is assigned X, comp is assigned O
# player1 (comp or player, whomever won) picks a square first
# player2 (comp or player, whomever won) picks next
# winner? this will be in a loop
# this continues until there is 3 in a row and there is a winner
# delcaration of winner

def initialize_board
  board = {}
  (1..9).each {|position| board[position] = ' ' }
  board
end

def empty_positions(board)
  board.keys.select {|position| board[position] != 'X' && 'O'}
end

def player_turn(board)
  puts "Let's play Tic Tac Toe! Pick a position 1-9 and try to beat me."
  position = gets.chomp.to_i
  board[position] = 'X'
end

def computer_turn(board)
  position = empty_positions(board).sample
  board[position] = 'O'
end

def winner_check(board)
  winning_combos = [[1, 2, 3], 
    [4, 5, 6], 
    [7, 8, 9], 
    [1, 4, 7], 
    [2, 5, 8], 
    [3, 6, 9], 
    [1, 5, 9],
    [3, 5, 7]]
    winning_combos.each do |combo|
      if board.select { |k,v| v == 'X' }.keys == combo
        puts "You've won! Great job!"
      elsif board.select { |k,v| v == 'O' }.keys == combo
        puts "Looks like the computer outsmarted you, try again!"
      else
        puts "Looks like you've tied, try again!"
      end
    end
  nil
end

def game_over?(board)
  empty_positions(board) == []
end

def draw_board(board)
  puts
  puts " #{board[1]} | #{board[2]} | #{board[3]} "
  puts "---+---+---"
  puts " #{board[4]} | #{board[5]} | #{board[6]} "
  puts "---+---+---"
  puts " #{board[7]} | #{board[8]} | #{board[9]} "
  puts
end

board = initialize_board
draw_board(board)

until winner_check(board) || game_over?(board)
  player_turn(board)
  draw_board(board)
  winner_check(board)
  computer_turn(board)
  draw_board(board)
  winner_check(board)
end
