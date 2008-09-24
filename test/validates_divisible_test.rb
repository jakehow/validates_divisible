require 'test/unit'
require 'rubygems'
require 'active_record'
require File.dirname(__FILE__) + '/../init'


class TestRecord < ActiveRecord::Base
  def self.columns; []; end
  attr_accessor :duration
  validates_divisible :duration, :by=>15, :message=>'must be divisible by 15.'
end

class ValidatesDivisibleTest < Test::Unit::TestCase
  def test_divisible_by_15_should_be_valid
    record = TestRecord.new
    record.duration = 30
    assert record.valid?
  end
  
  def test_divisible_by_15_should_not_be_valid
    record = TestRecord.new
    record.duration = 31
    assert !record.valid?
  end
end
