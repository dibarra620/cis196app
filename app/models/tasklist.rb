class Tasklist < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :user_id

  scope :ordertitle, -> {order(:title)}
  scope :orderuser, -> {order(:user)}
end
