class Word < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  belongs_to :category

  validates :content, presence: true

  accepts_nested_attributes_for :answers,
                               reject_if: lambda {|a| a[:content].blank?},
                               allow_destroy: true
end
