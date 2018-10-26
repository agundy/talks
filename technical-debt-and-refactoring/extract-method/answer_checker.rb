class AnswerChecker
    def initialize(answer_key_file)
        @answer_key_filename = answer_key_file
    end

    def print_score(answer_file)
        output = []
        output.append("Checking answers for #{answer_file}")

        # get the answer key and supplied answers
        answer_key = load_answer_file(@answer_key_filename)
        supplied_answers = load_answer_file(answer_file)

        test_length = answer_key.length
        if test_length != supplied_answers.length
            output.append("ERROR: didn't supply the right number of answers")
        end

        score = score_answers(answer_key, supplied_answers)

        output.append("Score:")
        output.append("#{score}/#{test_length}")
        output
    end

    def score_answers(key, answers)
        score = 0

        (0..key.length-1).each do |i|
            if key[i] == answers[i]
                score += 1
            end
        end

        score
    end

    private

    # load_answer_file takes a filename/path and returns the parsed lines
    def load_answer_file(filename)
        File.open(filename) do |f|
            f.readlines()
        end
    end
end
