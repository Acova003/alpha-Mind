class User < ActiveRecord::Base
  has_secure_password
  had_many :posts
end
