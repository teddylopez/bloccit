class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :sponsored_posts, dependent: :destroy

  validates :name, length: { minimum: 1 }, presence: true
  validates :description, length: { minimum: 10 }, presence: true

  scope :visible_to, ->  (user) { user ? all : where(public: true) }
end
