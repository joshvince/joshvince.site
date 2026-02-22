class JunkFood < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 35 }

  def record_answer(category, score)
    current = answers || {}
    arr = current.fetch(category.to_s, [])
    arr << score
    update!(answers: current.merge(category.to_s => arr))
  end

  def score_for(category)
    answers_for(category).sum
  end

  def answers_for(category)
    (answers || {}).fetch(category.to_s, [])
  end

  def complete?
    JunkFoodCategorisation.categories.all? do |cat|
      answers_for(cat).size >= JunkFoodCategorisation.question_count(cat)
    end
  end

  def current_category
    JunkFoodCategorisation.categories.find do |cat|
      answers_for(cat).size < JunkFoodCategorisation.question_count(cat)
    end
  end

  def current_step
    cat = current_category
    return 0 unless cat
    answers_for(cat).size
  end
end
