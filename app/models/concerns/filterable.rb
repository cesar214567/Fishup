module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      if filtering_params.empty?
        return results.all
      else
        results = 0
        filtering_params.each do |key, value|
          if results == 0
            results = self.where({key => value})
          else
            results = results.or(self.where({key => value}))
          end
        end
        puts results.to_sql
        results
      end
    end
  end
end
