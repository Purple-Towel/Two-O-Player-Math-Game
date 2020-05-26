class Question
  attr_accessor :result

  def initialize(curr_player)
    @rand_x = rand(20)
    @rand_y = rand(20)
    @sum_xy = @rand_x + @rand_y

    puts "#{curr_player}:#{@rand_x} + #{@rand_y} = ?"
    get_answer
  end

  def get_answer
    @input = gets.chomp
    if @input === @sum_xy.to_s
      puts "Correct!"
      @result = true
    else
      puts "Incorrect."
      @result = false
    end
  end
end