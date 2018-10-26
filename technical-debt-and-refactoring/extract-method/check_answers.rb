require './answer_checker'

answer_file = ARGV.first
output = AnswerChecker.new("files/answer_key.txt").print_score(answer_file)
puts output
