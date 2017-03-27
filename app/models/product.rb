class Product < ApplicationRecord
  belongs_to :category
  validates :productName, :price, presence: true

  # def self.search(search)
  #   if search
  #     where('name LIKE ?', "%#{term}%").order('id DESC')
  #   else
  #     all
  #   end
  # end

  mount_uploader :image, ImageUploader

end
