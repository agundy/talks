require "minitest/autorun"
require "./answer_checker"

class TestAnswerChecker < Minitest::Test
    def test_that_all_correct_works
        @answer_checker = AnswerChecker.new("files/test/answer_key.txt")
        output =  @answer_checker.print_score("files/test/all_correct.txt").join("")
        assert_match "all_correct", output
        assert_match "3/3", output
    end

    def test_that_none_correct_works
        @answer_checker = AnswerChecker.new("files/test/answer_key.txt")
        output =  @answer_checker.print_score("files/test/all_wrong.txt").join("")
        assert_match "all_wrong", output
        assert_match "0/3", output
    end

    def test_that_some_correct_works
        @answer_checker = AnswerChecker.new("files/test/answer_key.txt")
        output = @answer_checker.print_score("files/test/some_right.txt").join("")
        assert_match "some_right", output
        assert_match "1/3", output
    end
end
