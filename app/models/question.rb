class Question < ActiveRecord::Base
  has_many :answers
  validates_length_of :title, { minimum: 40, message: "must be 40 or more characters." }
  validates :username, presence: :true
  validates_length_of :body, { minimum: 150, maximum: 4000, message: "must be between 150-4000 characters." }
end
