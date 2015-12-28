class Word < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  belongs_to :category

  validates :content, presence: true

  accepts_nested_attributes_for :answers,
                               reject_if: lambda {|a| a[:content].blank?},
                               allow_destroy: true

  scope :all_words, ->user{}
  scope :learned, ->user{where "id IN (SELECT word_id FROM answers WHERE correct = 1 
    AND id IN (SELECT answer_id FROM results WHERE lesson_id IN
    (SELECT id FROM lessons WHERE user_id = #{user.id})))"}
  scope :not_learned, ->user{where "id NOT IN (SELECT word_id FROM answers WHERE correct = 1 
    AND id IN (SELECT answer_id FROM results WHERE lesson_id IN 
    (SELECT id FROM lessons WHERE user_id = #{user.id})))"}
  scope :filter_category, ->category{where category: category if category.present?}
end
