class SecondaryDevelopmentRecord < ActiveRecord::Base
  self.abstract_class = true
  establish_connection :development2
end
