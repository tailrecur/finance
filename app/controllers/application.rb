# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
    # Pick a unique cookie name to distinguish our session data from others'
    session :session_key => '_finance_session_id'

    def update_data
        uri = uri = URI::parse("http://www.amfiindia.com/test")
        FundManager.refresh_navs
        MutualFundInvestment.update_calculations
        Sip.update_calculations
        redirect_to :action => :index
    end
end
