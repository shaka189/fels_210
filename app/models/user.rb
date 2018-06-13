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
  scope :select_fields, ->{select :id, :email}

   def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end

end
