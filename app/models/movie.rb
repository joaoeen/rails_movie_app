class Movie < ActiveRecord::Base
    def self.all_ratings
        ['PG', 'R', 'PG-13', 'PG-17']
    end
end