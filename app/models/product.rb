class Product < ApplicationRecord
  belongs_to :store
  belongs_to :category
  has_many :order_items

  validates :price, :presence => true
  validates :name, :presence => true
  validates :description, :presence => true
  validates :image, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :image

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
