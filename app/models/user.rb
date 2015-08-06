class User < ActiveRecord::Base
  belongs_to :car
  validates :firsname, presence: true
  validates :surname, presence: true
  has_secure_password
  ROLES = %w[admin simple_user]
  def is?( requested_role )
    self.role == requested_role.to_s
  end
  

  def process_payment
    customer = Stripe::Customer.create email: email,
                                       card: card_token
    Stripe::Charge.create customer: customer.id,
                          amount: car.price*100,
                         description: car.brand,
                          currency: 'usd'
  end
end
