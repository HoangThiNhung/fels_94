class Result < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :answer
  belongs_to :word

  scope :correct_answer, ->{joins(:answer).where answers: {correct: true}}
end
