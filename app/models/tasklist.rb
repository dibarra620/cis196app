class Tasklist < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :user_id

  scope :sort_by_title, -> {order(:title)}
end
