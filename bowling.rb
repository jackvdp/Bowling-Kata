class Bowling
    
    def score_game(scores)
        score_array = convert_score_into_array(scores)
        frames_array = convert_frame_into_array(score_array)
        score_frames(frames_array)
    end 

    def convert_score_into_array(input)
        input.split(" ")
    end
    
    def convert_frame_into_array(input)
        input.map { |frame| frame.split("")}
    end

    def score_frames(frames)

        score = 0

        for i in 0..9 do
            balls = [frames[i], frames[i+1], frames[i+2]].compact.flatten

            if balls[0] == "X"
                score += 10
                score += convert_symbol(balls[1])
                score += convert_symbol(balls[2])
            elsif balls[1] == "/"
                score += 10
                score += convert_symbol(balls[2])
            else
                score += (convert_symbol(balls[0]) + convert_symbol(balls[1]))
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

end