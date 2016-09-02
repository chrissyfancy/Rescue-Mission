class Answer < ActiveRecord::Base
  belongs_to :question
  validates :username, presence: :true
  validates_length_of :body, { minimum: 50, maximum: 4000, message: "must be between 50-4000 characters." }
end
