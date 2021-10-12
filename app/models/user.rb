class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :real_address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :email, :password, :first_name, :last_name, :phone_number, :country, :city, :address, :birth_date, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :posts
  has_many :voted_spots
  has_many :verify_catch_spots


  def real_address
    "#{address},#{city},#{country}"
  end
end
