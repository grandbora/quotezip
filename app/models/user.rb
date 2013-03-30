class User < ActiveRecord::Base
  self.table_name = 'user'
  attr_accessible :email
end
