class Quote < ActiveRecord::Base
  set_table_name "quote"
  attr_accessible :content, :book
end