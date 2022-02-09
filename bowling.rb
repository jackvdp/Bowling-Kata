class Bowling    
    def convert_score_into_array(input)
        input.split(" ")
    end
    
    def convert_frame_into_array(input1)
        input1.map { |frame| frame.split("")}
    end

    def score_frames(frames)

        score = 0

        for i in 0..9 do
            frame = frames[i]
            nextFrame = frames[i+1]
            nextNextFrame = frames[i+2]

            if frame == ["X"]
                score += 10
                
                gettingNextFourBalls = nextFrame + nextNextFrame 

                score += convert_symbol(gettingNextFourBalls[0])
                score += convert_symbol(gettingNextFourBalls[1])

            elsif frame[1] == "/"
                score += 10
                score += convert_symbol(nextFrame[0])
            else
                score += (convert_symbol(frame[0]) + convert_symbol(frame[1]))
            end

        end

        return score

    end

    def convert_symbol(ball)

        case ball
        when "X"
            10
        when "/"
            10
        when "-"
            0
        else
            ball.to_i
        end

    end

   def score_game(scores)

    convert_array = convert_score_into_array(scores)
    scores_array = convert_frame_into_array(convert_array)
    score_frames(scores_array)
   end 

end