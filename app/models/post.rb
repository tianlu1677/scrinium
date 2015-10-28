class Post < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  belongs_to :postable, polymorphic: true

  validates :postable_id, :postable_type, uniqueness: { scope: :group_id }
end