class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :collaborations
  has_many :projects , through: :collaborations
  
  has_many :bugs

  enum roles: { developer:0, qa: 1, manager: 2 }
  
end
