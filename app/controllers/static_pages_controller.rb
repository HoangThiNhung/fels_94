class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @activities = current_user.load_activities.paginate page: params[:page], per_page: 10
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end