class JunkFoodQuestionMap
  QUESTIONS = [
    {
      key: "source",
      text: "Did you read this content from an algorithmically generated feed, or from something curated by a human?",
      options: [
        { key: "algorithm", text: "An algorithm fed it to me", score: 2 },
        { key: "human", text: "A human curated it", score: 0 }
      ]
    },
    {
      key: "feeling",
      text: "Did this content make you feel...",
      options: [
        { key: "angry", text: "Angry", score: 3 },
        { key: "hopeless", text: "Hopeless", score: 2 },
        { key: "happy", text: "Happy", score: 0 },
        { key: "nothing", text: "Nothing", score: 1 }
      ]
    }
  ].freeze

  def self.all
    QUESTIONS
  end

  def self.find(key)
    QUESTIONS.find { |q| q[:key] == key.to_s }
  end

  def self.question_at(index)
    QUESTIONS[index]
  end

  def self.count
    QUESTIONS.size
  end

  def self.max_score
    QUESTIONS.sum { |q| q[:options].map { |o| o[:score] }.max }
  end
end
