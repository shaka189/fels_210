class Result < ApplicationRecord
  belongs_to :answer
  belongs_to :lesson
  belongs_to :word
end
