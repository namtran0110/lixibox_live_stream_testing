class Store < ApplicationRecord
  belongs_to :user

  has_many :products, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one :stream_instance

  extend FriendlyId
  friendly_id :name, use: :slugged

  ratyrate_rateable "quality"

  validates :name, presence: true, uniqueness: { message: "Username already in use" }
  validates :slug, presence: true, uniqueness: { message: "Username already in use" }

  #image stuff
  has_attached_file :cover_photo, styles: { large: "800x800>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover_photo, content_type: /\Aimage\/.*\z/

end
