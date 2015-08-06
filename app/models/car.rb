class Car < ActiveRecord::Base
  has_many :users
  validates :brand,:model, :price, :energy, :image, presence: true
  validates :image,  allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
      }
  
  def self.find_car(car_id)
    self.find_by_id(car_id)
  end
end
