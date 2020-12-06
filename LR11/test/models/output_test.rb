require 'test_helper'

class OutputTest < ActiveSupport::TestCase
  test 'test_save_db' do
    instance = Output.create input: 1111, result: ActiveSupport::JSON.encode(1111), max: ActiveSupport::JSON.encode(1111)
    assert instance.save
    instance.delete
  end

  test 'check adding not unique value' do
    first = Output.create input: 123, result: ActiveSupport::JSON.encode(123), max: ActiveSupport::JSON.encode(123)
    first.save
    second = Output.create input: 123, result: ActiveSupport::JSON.encode(123), max: ActiveSupport::JSON.encode(123)
    second.validate
    assert_equal second.errors[:input], ['has already been taken']
  end

  test 'test_positive_value' do
    instance = Output.create input: -1, result: ActiveSupport::JSON.encode(0), max: ActiveSupport::JSON.encode(0)
    instance.validate
    assert_equal instance.errors[:input], ['must be greater than or equal to 0']
  end
end
