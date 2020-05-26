require "./player.rb"
require "./question.rb"

class Game
  attr_accessor :turn
  
  def initialize
    @curr_player = "P1"
    @p1 = Player.new
    @p2 = Player.new
    @p1_lives = "#{@p1.lives} of 3 lives"
    @p2_lives = "#{@p2.lives} of 3 lives"

    @game_over = false

    until @game_over
      turn
    end 
  end

  def turn
    puts "^^^---___ !NEW TURN! ___---^^^"
  
    question = Question.new(@curr_player)

    if question.result === false
      incorrect_answer
    end
    
    if @curr_player === "P1"
      @curr_player = "P2"
    else @curr_player === "P2"
      @curr_player = "P1"
    end

    puts "P1: #{@p1_lives} vs P2: #{@p2_lives}"
  end

  def incorrect_answer
    if @curr_player === "P1"
      @p1.lose_life
      @p1_lives = "#{@p1.lives} of 3 lives"

      if @p1.lives === 0
        @game_over = true
        puts "Game over, P2 has won with #{@p2.lives} remaining lives"
      end
    else @curr_player === "P2"
      @p2.lose_life
      @p2_lives = "#{@p2.lives} of 3 lives"

      if @p2.lives === 0
        @game_over = true
        puts "Game over, P1 has won with #{@p1.lives} remaining lives"
      end
    end
  end
end

start = Game.new