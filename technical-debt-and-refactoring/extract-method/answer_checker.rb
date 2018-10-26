class AnswerChecker
    def initialize(answer_key_file)
        @answer_key_filename = answer_key_file
    end

    def print_score(answer_file)
        output = []
        output.append("Checking answers for #{answer_file}")

        # open files and then read them
        answer_key_file = File.open(@answer_key_filename)
        supplied_answer_file = File.open(answer_file)

        answer_key = answer_key_file.readlines()
        supplied_answers = supplied_answer_file.readlines()

        test_length = answer_key.length
        if test_length != supplied_answers.length
            output.append("ERROR: didn't supply the right number of answers")
        end

        score = 0
        (0..test_length-1).each do |i|
            if answer_key[i] == supplied_answers[i]
                score += 1
            end
        end

        output.append("Score:")
        output.append("#{score}/#{test_length}")
        output
    end
end
