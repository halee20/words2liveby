class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :words

  has_many :comments

  has_many :likes

  has_many :liked_words, :through => :likes, :source => :word

  validates :username, :presence => true

  validates :username, :uniqueness => true

  validates :email, :presence => true
  

end
