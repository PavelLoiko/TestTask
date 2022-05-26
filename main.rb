# frozen_string_literal: true

require './services/questionnaire'

def main
  p "Cool! your rating is - #{Questionnaire.do_prompt}%"
  p "Average rating is - #{StoredData.do_all_time_report}%"
end

main
