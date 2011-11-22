class User < ActiveRecord::Base
  has_many :articles
  has_many :views
  has_many :comments
end
