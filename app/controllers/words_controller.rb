class WordsController < ApplicationController
  def index
    @categories = Category.all
    if params[:option].present?
      @words = Word.filter_category(params[:category_id]).send params[:option], current_user
    else
      @words = Word.all
    end
    @words = @words.paginate page: params[:page], per_page: 40
  end
end
