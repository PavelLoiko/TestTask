# frozen_string_literal: true

require 'pstore' # https://github.com/ruby/pstore
require './configs/config'

# Class StoredData store functions for counting results of questionnaire and saving answers.
class StoredData
  @store = PStore.new(STORE_NAME)

  # Input: count of 'yes' and 'no' answers in the result of the test.
  # Result: save increment int values to 'pstore' file as hash.
  def self.save_answers(count_yes_answers, count_no_answers)
    @store.transaction do
      @store[:answers_count] ||= { y: 0, n: 0 }
      @store[:answers_count][:y] += count_yes_answers
      @store[:answers_count][:n] += count_no_answers
    end
  end

  # Input: count of 'yes' answers and count of questions.
  # Result: printed result in console as a percentage.
  def self.do_report(count_yes_answers)
    count_yes_answers * 100.0 / QUESTIONS.count
  end

  # Input: a 'pstore' file with a hash structure, that stores the ratio of the number of answers 'yes' and 'no'.
  # Result: printed average result in console as a percentage.
  def self.do_all_time_report
    @store.transaction(true) do
      result = (@store[:answers_count][:y] * 100.0 / @store[:answers_count].values.sum).round(1)
      result
    end
  end
end
