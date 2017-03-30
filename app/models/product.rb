class Product < ApplicationRecord
  # attr_accessible :productName, :mfr, :productInfo, :price, :quantity

  belongs_to :category
  validates :productName, :productInfo, :price, :quantity, :mfr, presence: true
  validates :mfr, uniqueness: true

  # def self.search(search)
  #   if search
  #     where('name LIKE ?', "%#{term}%").order('id DESC')
  #   else
  #     all
  #   end
  # end

  mount_uploader :image, ImageUploader

end
