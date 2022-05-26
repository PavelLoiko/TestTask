# frozen_string_literal: true

require 'rspec/autorun'

require './services/stored_data'

describe 'StoredData' do
  it 'should check output of do_report function with different input values' do
    puts 'test for do_report function'
    [0, 2, 4].each do |i|
      (expect(StoredData.do_report(i)).to eq 100.0 * i / 5)
    end
  end

  it "should check that output of do_all_time_report function isn't more then 100%" do
    puts 'test for do_all_time_report function'
    expect((StoredData.do_all_time_report) <= 100.0).to eq true
  end
end
