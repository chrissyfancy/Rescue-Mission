class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order("created_at DESC")
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question was successfully created."
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    if @question.save
      flash[:notice] = "Question was succesfully updated."
      redirect_to question_path(@question)
    else
      render :edit
    end
  end


  def destroy
    Question.destroy(params[:id])
    if !@question
      flash[:notice] = "Question deleted."
      redirect_to :index
    else
      render :show
    end
  end

private

  def question_params
    params.require(:question).permit(:title, :body, :username)
  end
end
