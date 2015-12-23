class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :results, dependent: :destroy

  validates :user_id, presence: true
  validates :category_id, presence: true

  accepts_nested_attributes_for :results, allow_destroy: true

  before_create :add_question

  private
  def add_question
    words = category.words.order("RAND()").limit(10)
    words.each{|word| results.build word: word}
  end
end
