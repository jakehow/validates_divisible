# Include hook code here
require File.dirname(__FILE__) + '/lib/validates_divisible'
ActiveRecord::Base.send(:extend, ValidatesDivisible)