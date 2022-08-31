
class Game

@@turn_count = 0
@@winner = ""
    def initialize
        puts "Player one, please enter your name."
        @player_one_name = gets.chomp
        puts "Great, #{@player_one_name} will be X's"
        puts "Player two, please enter your name."
        @player_two_name = gets.chomp
        puts "Great, #{@player_two_name} will be O's"
        @board =Array.new(9){|choice|choice+=1}.map{|n|n-1}
        draw_board
        @@turn_count+=1
    end

    def selection_made_update(input)
        if input.between?(0,8) && @board[input].is_a?(Numeric)
            if @@turn_count.even?
                @board[input] = "O"
                draw_board  
            elsif @@turn_count.odd?
                @board[input] = "X"
                draw_board  
            end
        else
            # until input.between?(0,8) && @board[input].is_a?(Numeric)
            #     puts "Please make a valid selection:"
            #     input = gets.chomp.to_i
            #     selection_made_update(input)
            # end
        end
    end

    def check_winner
        #three down variables
        three_down_one = @board[0].to_s + @board[3].to_s + @board[6].to_s
        three_down_two = @board[1].to_s + @board[4].to_s + @board[7].to_s 
        three_down_three = @board[2].to_s + @board[5].to_s + @board[8].to_s 

        three_diagonal_one = @board[0].to_s + @board[4].to_s + @board[8].to_s
        three_diagonal_two = @board[6].to_s + @board[4].to_s + @board[2].to_s

        #three diagonal variables


        #three_accross
        if @board[0..2].all?("X") || @board[3..5].all?("X") || @board[6..8].all?("X") 
            puts "#{@player_one_name} won the game!"
            @@winner = @player_one_name
        elsif @board[0..2].all?("O") || @board[3..5].all?("O") || @board[6..8].all?("O") 
            puts "#{@player_two_name} won the game!"
            @@winner = @player_two_name
        end

        #three_down

        if three_down_one == "XXX" || three_down_two == "XXX" || three_down_three == "XXX"
            puts "#{@player_one_name} won the game!"
            @@winner = @player_one_name
        elsif three_down_one == "OOO" || three_down_two == "OOO" || three_down_three == "OOO"
            puts "#{@player_two_name} won the game!"
            @@winner = @player_two_name
        end


        if three_diagonal_one == "XXX" || three_diagonal_two == "XXX"
            puts "#{@player_one_name} won the game!"
            @@winner = @player_one_name
        elsif three_diagonal_one == "OOO" || three_diagonal_two == "OOO"
            puts "#{@player_two_name} won the game!"
            @@winner = @player_two_name
        end

    end

        #three_diagonal




    def play_game
        while @@turn_count != 10 && @@winner.empty?
            if @@turn_count.odd?
                # puts "#{@player_one_name}, please make a selection:"
                # input = gets.chomp.to_i 
                input = -1
                until input.between?(0,8) && @board[input].is_a?(Numeric)
                    puts "#{@player_one_name}, please make a selection:"
                    input = gets.chomp.to_i
                end

                selection_made_update(input)
                check_winner
                @@turn_count +=1  
                
            elsif @@turn_count.even?
                input = -1
                until input.between?(0,8) && @board[input].is_a?(Numeric)
                    puts "#{@player_two_name}, please make a selection:"
                    input = gets.chomp.to_i
                end

                selection_made_update(input)
                check_winner
                @@turn_count +=1   

            end

        end
    end

    def draw_board
        puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
        puts "----------"
        puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
        puts "----------"
        puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    end
end

game = Game.new
game.play_game