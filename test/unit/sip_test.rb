require File.dirname(__FILE__) + '/../test_helper'

class SipTest < Test::Unit::TestCase
    fixtures :sips, :mutual_funds

    def test_update_current_value
        sip = sips(:home)
        assert_in_delta 16836.0, sip.update_current_value, 0.001
    end

    def test_update_calculations
        sip = sips(:home)
        sip.current_value = nil
        sip.save

        Sip.update_calculations
        assert_not_nil Sip.find(sip.id).current_value
    end
end
