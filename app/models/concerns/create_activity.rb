 module CreateActivity 
  def create_activity action, target, user_id
    Activity.create action: action, target: target, user_id: user_id
  end
end