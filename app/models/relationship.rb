class Relationship < ActiveRecord::Base
  include CreateActivity

  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: User.name

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  before_create :create_follow_activity
  before_destroy :create_unfollow_activity

  private
  def create_follow_activity
    create_activity :follow, followed.id, follower.id
  end

  def create_unfollow_activity
    create_activity :unfollow, followed.id, follower.id
  end
end