require 'net/http'
require 'hpricot'
require 'retrieval/money_control_reader'
require 'retrieval/amfi_reader'

class FundManager
    @@readers = [AmfiReader, MoneyControlReader]

    def self.refresh_navs
        @@readers.each do |reader|
            fund_navs = reader.retrieve_fund_navs
            if !fund_navs.empty?
                update_navs(fund_navs, reader)
                break
            end
        end
    end

    private

    def self.update_navs fund_navs, reader
        used_funds = MutualFund.find(:all)
        MutualFund.transaction do
            for fund in used_funds
                latest_nav = fund_navs[fund.send(reader.key)]
                fund.nav = latest_nav.to_f
                fund.save
            end                        
        end
    end
end
