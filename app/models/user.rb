class User < ActiveRecord::Base
  has_many :lists

  #has_secure_password invokes password_digest
  #comment out when testing password in console
  #has_secure_password
end
