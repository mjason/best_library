class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :reset_token

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :phone 
  validates :phone, numericality: true, length: { is: 11 }

  has_many :books

  def reset_token
    self.update({token: "#{SecureRandom.hex(10)}:#{self.id}"})
  end

end
