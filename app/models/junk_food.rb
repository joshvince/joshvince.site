class JunkFood < ApplicationRecord
  def current_question_index
    (answers || {}).size
  end

  def current_question
    JunkFoodQuestionMap.question_at(current_question_index)
  end

  def complete?
    current_question_index >= JunkFoodQuestionMap.count
  end

  def record_answer(question_key, answer_key)
    update!(answers: (answers || {}).merge(question_key => answer_key))
  end
end
