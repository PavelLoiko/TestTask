# frozen_string_literal: true

require 'highline/import' # https://github.com/ruby/pstore#readme
require './services/stored_data'
require './configs/config'

# Class Questionnaire store common function that sends user questions and takes and counts it's questions.
class Questionnaire
  # Input: hash data with questions from config file.
  # Result: passing the test and saving it to a file and outputting the results.
  def self.do_prompt
    count_yes_answers = 0
    count_no_answers = 0

    QUESTIONS.each_key do |question_key|
      agree(QUESTIONS[question_key]) ? count_yes_answers += 1 : count_no_answers += 1
    end

    StoredData.save_answers(count_yes_answers, count_no_answers)
    StoredData.do_report(count_yes_answers)
  end
end
