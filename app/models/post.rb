class Post < ActiveRecord::Base
  belongs_to :user

  validates :rating, presence: true
  validates :content, presence: true 
end
