class Reference < ActiveRecord::Base
  extend Enumerize

  validates_uniqueness_of :title, scope: :year
  validates :title, :authors, :year, :pages, presence: true
  belongs_to :publicable, polymorphic: true
  has_attached_file :file
  validates_attachment_content_type :file, content_type: ['application/pdf']
  has_many :publications, dependent: :destroy
  has_many :users, through: :publications

  validates_presence_of :reference_type

  enumerize :reference_type, in: [
    :article,
    :book
  ]
end
