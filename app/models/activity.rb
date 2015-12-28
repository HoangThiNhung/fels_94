class Activity < ActiveRecord::Base
  belongs_to :user

  scope :show_activity, ->user_id{where(Settings.sql.show_activity, user_id, user_id).order "created_at DESC"}

  def action_name object
    object.find_by id: self.target
  end
end
