# == Schema Information
#
# Table name: group_options
#
#  id          :integer          not null, primary key
#  group_id    :integer
#  front_cover :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class GroupOption < ActiveRecord::Base
end
