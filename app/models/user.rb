class User < ActiveRecord::Base;
	has_many :posts 
	has_many :comments
	has_many :votes

	has_secure_password validations: false
	validates :username, presence: :true, uniqueness: :true
	validates :password, presence: :true, confirmation: :true, length: {minimum: 6}, on: :create
	validates :password_confirmation, presence: :true, on: :create

end