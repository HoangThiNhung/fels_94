class Word < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  belongs_to :category

  validates :content, presence: true

  accepts_nested_attributes_for :answers,
                               reject_if: lambda {|a| a[:content].blank?},
                               allow_destroy: true

  scope :all_words, ->user{}
  scope :learned, ->user{where(Settings.sql.word_learned, user.id)}
  scope :not_learned, ->user{where(Settings.sql.not_learned, user.id)}
  scope :filter_category, ->category{where category: category if category.present?}
end
