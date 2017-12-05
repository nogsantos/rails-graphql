class Actor < ApplicationRecord
    has_and_belongs_to_many :movies

    def response
        "Actor: #{self.name} #{bio}"
    end
end
