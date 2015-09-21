class Resource < ActiveRecord::Base
  belongs_to :resourceable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :collections, as: :collectable, dependent: :destroy

  has_attached_file :file
  validates_attachment_content_type :file, content_type: [
    /\Aimage\/.*\Z/,
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
  ]
  validates_attachment_size :file, less_than: 10.megabytes

  validates_presence_of :name, if: 'file.nil?'

  acts_as_taggable
  acts_as_taggable_on :categories

  enum resource_type: [
    :invalid,
    :figure,
    :datum,
    :document
  ].map { |x| I18n.t("resource.types.#{x}") }

  def user
    User.find(self.user_id)
  end

  def app
    engine = self.resourceable.class.parent_name
    engine ? engine.to_s.underscore : 'main_app'
  end

  def file_type
    Mime::EXTENSION_LOOKUP.select { |k, v| v == self.file_content_type }.keys.first.to_sym
  end

  def image?
    self.file_content_type =~ /\Aimage\/.*\Z/
  end
end
