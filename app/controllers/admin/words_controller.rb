class Admin::WordsController < ApplicationController
  before_action :logged_in_user, :admin_user
  before_action :get_all_category, only: [:new, :show, :edit, :create]
  before_action :find_word, only: [:show, :edit, :update]

  def index
    @words = Word.paginate page: params[:page], per_page: 100
  end

  def show
  end

  def new
    @word = Word.new
    Settings.number.questions.times do
      @word.answers.build
    end
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = t "admin.word.message.create_success"
      redirect_to admin_word_url @word
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @word.update_attributes word_params
      flash[:success] = t "admin.word.message.update_success"
      redirect_to admin_word_url @word
    else
      render "edit"
    end
  end

  def destroy
    Word.find(params[:id]).destroy
    flash[:success] = t "admin.word.message.delete_success"
    redirect_to :back
  end

  private

  def get_all_category
    @categories = Category.all
  end

  def word_params
    params.require(:word).permit :content, :category_id,
     answers_attributes: [:id, :content, :correct]
  end

  def find_word
    @word = Word.find params[:id]
    @answers = @word.answers
  end
end