class Comment < ActiveRecord::Base
  belongs_to :timeline
  #belongs_to :msg, :class_name => 'Timeline'
end
