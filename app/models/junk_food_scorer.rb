class JunkFoodScorer
  def initialize(junk_food)
    @junk_food = junk_food
  end

  def score
    @junk_food.answers.sum do |question_key, answer_key|
      question = JunkFoodQuestionMap.find(question_key)
      next 0 unless question

      option = question[:options].find { |o| o[:key] == answer_key }
      option ? option[:score] : 0
    end
  end

  def max_score
    JunkFoodQuestionMap.max_score
  end

  def display_score
    "#{score}/#{max_score}"
  end

  def percentage
    return 0 if max_score.zero?
    ((score.to_f / max_score) * 100).round
  end
end
