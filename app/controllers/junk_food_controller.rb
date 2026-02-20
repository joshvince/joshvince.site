class JunkFoodController < ApplicationController
  layout false

  def new
    @recent_foods = JunkFood.order(created_at: :desc).limit(50).select(&:complete?).first(20)
  end

  def create
    junk_food = JunkFood.create!(name: params[:name])
    redirect_to junk_food_show_path(junk_food)
  end

  def show
    @junk_food = JunkFood.find(params[:id])
    @question = @junk_food.current_question
    @scorer = JunkFoodScorer.new(@junk_food) if @junk_food.complete?
  end

  def update
    @junk_food = JunkFood.find(params[:id])
    @junk_food.record_answer(params[:question_key], params[:answer_key])

    @question = @junk_food.current_question
    @scorer = JunkFoodScorer.new(@junk_food) if @junk_food.complete?

    if @junk_food.complete?
      render partial: "score", locals: { junk_food: @junk_food, scorer: @scorer }
    else
      render partial: "question", locals: { junk_food: @junk_food, question: @question }
    end
  end
end
