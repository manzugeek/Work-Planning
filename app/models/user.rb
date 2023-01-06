class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :capitalize_name
  validates :name, presence: true
  validates :email, format: { with: /(\S+)@(\S+)/ }
  

  has_one :worker, dependent: :destroy

  
  def capitalize_name
    self.name = name.capitalize
  end

end
