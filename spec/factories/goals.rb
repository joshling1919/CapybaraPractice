# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :goal do
    
  end
end
