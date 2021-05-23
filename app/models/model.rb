class Model < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :rememberable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  has_many :articles, foreign_key: :author_id, inverse_of: :author
  has_many :likes, dependent: :destroy
  ROLES = {
    user: 0,
    admin: 1
  }.with_indifferent_access.freeze

  enum role: ROLES

end
