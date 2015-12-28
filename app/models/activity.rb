class Activity < ActiveRecord::Base
  belongs_to :user

  scope :show_activity, ->user_id{where("user_id IN (SELECT followed_id FROM
    relationships WHERE follower_id = #{user_id}) OR user_id = #{user_id}").order "created_at DESC"}

  def action_name object
    object.find_by id: self.target
  end
end
