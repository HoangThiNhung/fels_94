class Word < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  belongs_to :category
end
