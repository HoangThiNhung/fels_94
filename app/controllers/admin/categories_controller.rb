class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user, :admin_user

  def index
    @categories = Category.paginate page: params[:page], per_page: 5
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "deleted"
    redirect_to admin_root_path
  end
end