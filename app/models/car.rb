class Car < ActiveRecord::Base
  validates :brand,:model, :price, :energy, :image, presence: true
  validates :image,  allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
      }
  
end
