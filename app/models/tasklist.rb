class Tasklist < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :user_id
end
