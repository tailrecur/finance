require 'hpricot'
require 'retrieval/retrieval_helper'
require 'open-uri'

class MoneyControlReader
    NAV_LIST_URL = "http://www.moneycontrol.com/mf/mfinfo/latestnav/index.php"
#    NAV_LIST_URL = "http://localhost:3000/moneycontrol/latest_nav.htm"
    #    NAV_LIST_URL = "file://C:/workspace/finance/public/moneycontrol/latest_nav.htm"

    def self.retrieve_fund_navs
        fund_navs = {}
        begin
            doc = Hpricot(open(NAV_LIST_URL))
#        nav_table = doc.search("/html/div/div[1]/div[6]/html/head//table")[6].search("//tr")
            nav_table = doc.search("/html/div/div[1]/div[6]/html/head/td[1]/table[3]//tr[@bgcolor='#ffffff']")
            nav_table.each do |tr|
                tds = tr.search("//td")
                fund_navs[RetrievalHelper.extract_leaf(tds[0])] = RetrievalHelper.extract_leaf(tds[2])
            end
        rescue
            puts "\n!!!---------------Could not retrieve NAV data from MoneyControl!!!\n\n"
        end
        return fund_navs
    end

    def self.key
        :name
    end
end