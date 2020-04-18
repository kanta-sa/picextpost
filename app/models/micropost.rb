class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  #favorite機能の実装について
  has_many :favorites, dependent: :destroy
  has_many :favorite_of_users, through: :favorites, source: :user
  
  mount_uploader :image, ImageUploader
end
