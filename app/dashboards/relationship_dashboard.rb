require "administrate/base_dashboard"

class RelationshipDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    follower: Field::BelongsTo.with_options(class_name: "User"),
    followed: Field::BelongsTo.with_options(class_name: "User"),
    id: Field::Number,
    follower_id: Field::Number,
    followed_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :follower,
    :followed,
    :id,
    :follower_id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :follower,
    :followed,
    :follower_id,
    :followed_id,
  ]

  # Overwrite this method to customize how relationships are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(relationship)
  #   "Relationship ##{relationship.id}"
  # end
end
