class Article < ApplicationRecord
  include Visible
  belongs_to :author, class_name: 'Model'
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
