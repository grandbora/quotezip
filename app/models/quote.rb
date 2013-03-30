class Quote < ActiveRecord::Base
  self.table_name = 'quote'
  attr_accessible :content, :book
end
