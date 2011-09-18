class Calculator
    def self.future_value amount, interest_rate, periods
        return amount * periods if interest_rate == 0
        i = interest_rate.to_f/100
        puts i
        (amount * ((1+i)**periods - 1)/i)*(1+i)
    end

    def self.sip_irr current_value, amount, periods
        low_rate = calc_rate(current_value, amount, periods, -1)
        high_rate = calc_rate(current_value, amount, periods, 1)
        irr_binary_search current_value, amount, periods, low_rate, high_rate
    end

    def self.calc_rate  current_value, amount, periods, start_rate
        operator = (start_rate < 0) ? ">" : "<"
        while(future_value(amount, start_rate, periods).send(operator, current_value)) do start_rate *= 2 end
        return start_rate
    end

    def self.irr_binary_search current_value, amount, periods, low_rate, high_rate
        median_rate = (low_rate.to_f + high_rate.to_f) / 2
        future_val = future_value(amount, median_rate, periods)
        return median_rate if (same?(future_val,current_value)|| low_rate == high_rate)
        return irr_binary_search(current_value,amount, periods, low_rate, median_rate) if(future_val > current_value)
        return irr_binary_search(current_value,amount, periods, median_rate, high_rate)
    end

    def self.same?(future_val, current_value)
        return (future_val - current_value).abs < 1
    end
end