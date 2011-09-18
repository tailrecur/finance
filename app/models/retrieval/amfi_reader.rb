require 'open-uri'
require 'hpricot'

class AmfiReader
    NAV_LIST_URL = "http://www.amfiindia.com/portal/upload/downloadnav.txt"
#    NAV_LIST_URL = "http://localhost:3000/amfi/downloadnav.txt"

    def self.retrieve_fund_navs
        fund_navs = {}
        begin
            funds_data = URI.parse(NAV_LIST_URL).read.split("\n")
            funds_data.each do |fund|
                fund_data = fund.split ";"
                puts fund_data.size
                fund_navs[fund_data[0]] = fund_data[2] if (fund_data.size == 6)
            end
        rescue
            puts "\n!!!---------------Could not retrieve NAV data from AMFI!!!\n\n"
        end
        return fund_navs
    end

    def self.key
        :amfi_symbol
    end
end