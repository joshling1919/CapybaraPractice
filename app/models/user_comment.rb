# == Schema Information
#
# Table name: user_comments
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  user_id    :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserComment < ActiveRecord::Base
  belongs_to :author,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :User

  # belongs_to :user,
  # primary_key: :id,
  # foreign_key: :user_id,
  # class_name: :User
end
