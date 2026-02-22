class JunkFoodController < ApplicationController
  layout false

  def intro
  end

  def new
    @recent_foods = JunkFood.order(created_at: :desc).limit(50).select(&:complete?).first(20)
  end

  def create
    junk_food = JunkFood.create!(name: params[:name])
    redirect_to junk_food_show_path(junk_food)
  end

  def show
    @junk_food = JunkFood.find(params[:id])

    unless @junk_food.complete?
      @current_category = @junk_food.current_category
      @current_step = @junk_food.current_step
      @question = JunkFoodCategorisation.question_at(@current_category, @current_step)
    end
  end

  def update
    @junk_food = JunkFood.find(params[:id])

    category = params[:current_category].to_sym
    step = params[:category_step].to_i
    choice_index = params[:choice_index].to_i

    score = JunkFoodCategorisation.question_at(category, step)[:choices][choice_index][:score]
    @junk_food.record_answer(category, score)

    if @junk_food.complete?
      render partial: "score", locals: { junk_food: @junk_food }
    else
      @current_category = @junk_food.current_category
      @current_step = @junk_food.current_step
      question = JunkFoodCategorisation.question_at(@current_category, @current_step)
      render partial: "question", locals: {
        junk_food: @junk_food,
        question: question,
        current_category: @current_category,
        current_step: @current_step
      }
    end
  end
end
