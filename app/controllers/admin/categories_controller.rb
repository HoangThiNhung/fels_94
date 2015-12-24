class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user, :admin_user
  before_action :load_category, only: [:show, :edit, :update]

  def index
    @categories = Category.paginate page: params[:page], per_page: 5
  end

  def show
    @words = @category.words.paginate page: params[:page], per_page: 100
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "admin.category.create_success"
      redirect_to admin_root_url
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "admin.category.update_success"
      redirect_to admin_category_url
    else
      render "edit"
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = t "admin.category.delete_success"
    redirect_to admin_root_path
  end

  private

  def category_params
    params.require(:category).permit :name, :description
  end

  def load_category
    @category = Category.find params[:id]
  end
end