class User < ActiveRecord::Base
  devise :rememberable, :omniauthable, :omniauth_providers => [:twitter]

  def self.find_or_create_via_twitter(userHash)
    user = User.where(:uid => userHash.uid).first
    user = create_from_twitter(userHash) unless user

    user
  end

  def self.create_from_twitter(userHash)
    User.new(:uid => userHash[:uid],
             :user_name => userHash[:info][:nickname],
             :name => userHash[:info][:name],
             :avatar => userHash[:info][:image],
             :url => userHash[:info][:urls][:Twitter])
  end

end
