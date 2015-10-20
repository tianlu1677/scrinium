# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  avatar                  :string
#  name                    :string           not null
#  email                   :string           not null
#  encrypted_password      :string           not null
#  gender                  :string           not null
#  position                :string
#  role                    :string           not null
#  status                  :string
#  current_organization_id :integer
#  reset_password_token    :string
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  sign_in_count           :integer          default(0), not null
#  current_sign_in_at      :datetime
#  last_sign_in_at         :datetime
#  current_sign_in_ip      :inet
#  last_sign_in_ip         :inet
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
