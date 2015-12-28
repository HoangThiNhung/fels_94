class Lesson < ActiveRecord::Base
  include CreateActivity

  belongs_to :category
  belongs_to :user
  has_many :results, dependent: :destroy

  validates :user_id, presence: true
  validates :category_id, presence: true

  accepts_nested_attributes_for :results, allow_destroy: true

  before_create :add_question
  after_create :create_learning_activity
  before_update :create_learned_activity

  private
  def add_question
    words = category.words.order("RAND()").limit(10)
    words.each{|word| results.build word: word}
  end

  def create_learning_activity
    create_activity :learning, self.id, self.user.id
  end

  def create_learned_activity
    create_activity :learned, self.id, self.user.id
  end
end
