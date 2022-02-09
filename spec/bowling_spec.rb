require_relative '../bowling'

describe Bowling do

    input1 = "X X X X X X X X X X X X"
    input2 = "9- 9- 9- 9- 9- 9- 9- 9- 9- 9-"
    input3 = "5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/5"
    input4 = "5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5-"

    result1 = 300
    result2 = 90
    result3 = 150
    result4 = 140


    it "convert score into array" do
        # Arrange
        bowling = described_class.new

        # Act
        testResults1 = bowling.convert_score_into_array(input1)
        testResult2 = bowling.convert_score_into_array(input2)
        testSpareResult = bowling.convert_score_into_array(input3)

        # Assert
        expect(testResults1).to eq(["X", "X", "X", "X", "X", "X", "X", "X", "X", "X", "X", "X"])
        expect(testResult2).to eq(["9-", "9-", "9-", "9-", "9-", "9-", "9-", "9-", "9-", "9-"])
        expect(testSpareResult).to eq(
            ["5/", "5/", "5/", "5/", "5/", "5/", "5/", "5/", "5/", "5/5"]
        )
    end
    
    it " convert frames into an array " do
        # Arrange
        bowling = described_class.new
        
        # Act
        testResult3 = bowling.convert_frame_into_array(["X", "X", "X", "X", "X", "X", "X", "X", "X", "X", "X", "X"])
        testResult4 = bowling.convert_frame_into_array(["9-", "9-", "9-", "9-", "9-", "9-", "9-", "9-", "9-", "9-"])
        testSpareResult2 = bowling.convert_frame_into_array(["5/", "5/", "5/", "5/", "5/", "5/", "5/", "5/", "5/", "5/5"])

        # Assert
        expect(testResult3).to eq([["X"], ["X"],["X"],["X"], ["X"],["X"],["X"], ["X"],["X"],["X"], ["X"], ["X"]])
        expect(testResult4).to eq([["9", "-"],["9", "-"],["9", "-"],["9", "-"],["9", "-"],["9", "-"],["9", "-"],["9", "-"],["9", "-"],["9", "-"]])
        expect(testSpareResult2).to eq(
            [
                ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/", "5"]
            ]
        )
    end

    it "convert Symbol into number" do
        # Arrange
        bowling = described_class.new
        
        # Act
        strikeResult = bowling.convert_symbol("X")
        spareResult = bowling.convert_symbol("/")
        gutterResult = bowling.convert_symbol("-")
        numberResult = bowling.convert_symbol("9")

        # Assert
        expect(strikeResult).to eq(10)
        expect(spareResult).to eq(10)
        expect(gutterResult).to eq(0)
        expect(numberResult).to eq(9)

    end

    it "score frames" do
        # Arrange
        bowling = described_class.new
        
        # Act
        testResult5 = bowling.score_frames([["X"], ["X"],["X"],["X"], ["X"],["X"],["X"], ["X"],["X"],["X"], ["X"], ["X"]])
        testResult6 = bowling.score_frames([["9", "-"],["9", "-"],["9", "-"],["9", "-"],["9", "-"],["9", "-"],["9", "-"],["9", "-"],["9", "-"],["9", "-"]])
        testSpareResult3 = bowling.score_frames([
                ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/", "5"]
            ])

        # Assert
        expect(testResult5).to eq(result1)
        expect(testResult6).to eq(result2)
        expect(testSpareResult3).to eq(result3)

    end

    it "score game" do 

      bowling = described_class.new
        
        # Act
        testScores1 = bowling.score_game(input1)
        testScores2 = bowling.score_game(input2)
        testScores3 = bowling.score_game(input3)
        testScores4 = bowling.score_game(input4)

        # Assert
        expect(testScores1).to eq(result1)
        expect(testScores2).to eq(result2)
        expect(testScores3).to eq(result3)
        expect(testScores4).to eq(result4)
    end

end 