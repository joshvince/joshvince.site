module JunkFoodHelper
  def category_score(category, junk_food)
    junk_food.score_for(category)
  end

  def category_color_for(category, junk_food)
    answers = junk_food.answers_for(category)
    return "var(--bauhaus-cream)" if answers.empty?

    score = answers.sum
    level = JunkFoodCategorisation.threshold_level(category, score)

    case level
    when :high then "var(--bauhaus-red)"
    when :medium then "var(--bauhaus-orange)"
    else "var(--bauhaus-green)"
    end
  end
end
