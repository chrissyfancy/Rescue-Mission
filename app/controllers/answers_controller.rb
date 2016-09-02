class AnswersController < ApplicationController
  def index
    @answers = Answer.where(question_id: params[:question_id])
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.create(answer_params)
    @answer.question_id = params[:question_id]
    if @answer.save
      flash[:notice] = "Answer succesfully saved."
      redirect_to question_path(@question)
    else
      render :new
    end
  end

private
  def answer_params
    params.require(:answer).permit(:question_id, :body, :username)
  end
end
