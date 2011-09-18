require File.dirname(__FILE__) + '/../test_helper'
require 'util/calculator'

class CalculatorTest < Test::Unit::TestCase

  def test_sip_irr
#           actual_irr = Calculator.sip_irr(47177.94, 1000, 2)
     actual_irr = Calculator.sip_irr( 1342.3714 , 500, 14)
    assert_in_delta(8.93, actual_irr, 0.01)
  end
end
