module JunkFoodHelper
  def category_score(category, junk_food)
    junk_food.score_for(category)
  end

  def category_color_class_for(category, junk_food)
    answers = junk_food.answers_for(category)
    return "bg-bauhaus-blue" if answers.empty?

    score = answers.sum
    level = JunkFoodCategorisation.threshold_level(category, score)

    case level
    when :high then "bg-bauhaus-red"
    when :medium then "bg-bauhaus-orange"
    else "bg-bauhaus-green"
    end
  end
end
