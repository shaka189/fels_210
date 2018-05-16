class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lessons
  has_many :activities
  has_many :active_relationships, class_name:  Relationship.name,
                                   foreign_key: :follower_id,
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  Relationship.name,
                                   foreign_key: :followed_id,
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  paginates_per Settings.perpage
  scope :order_date_desc, ->{order created_at: :desc}
end
