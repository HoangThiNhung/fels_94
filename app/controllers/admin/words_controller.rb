class Admin::WordsController < ApplicationController
  before_action :logged_in_user, :admin_user
  before_action :get_all_category, only: [:new, :show, :edit]

  def index
    @words = Word.paginate page: params[:page], per_page: 100
  end

  def show
    @word = Word.find params[:id]
    @answers = @word.answers
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
      redirect_to admin_words_url
    else
      render "new"
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
     answers_attributes: [:content, :correct]
  end

end