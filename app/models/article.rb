class Article < ActiveRecord::Base
  has_many :comments
  has_many :views
  belongs_to :user
end
