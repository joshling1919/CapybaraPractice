# == Schema Information
#
# Table name: goal_comments
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  goal_id    :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GoalComment < ActiveRecord::Base
  belongs_to :author,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :User

  belongs_to :goal
end
