module WorthHelper
    def options_for_association_conditions(association)
        if association.name == :mutual_funds && !params[:action].nil?
            ['fund_type = ?', params[:action]]
        else
            super
        end
    end
end
