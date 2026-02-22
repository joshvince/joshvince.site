module JunkFoodCategorisation
  CATEGORIES = [ :addictiveness, :griftiness, :emotiveness, :recursiveness, :americaness ].freeze

  DISPLAY_NAMES = {
    addictiveness: "Addictiveness",
    griftiness: "Griftiness",
    emotiveness: "Emotiveness",
    recursiveness: "Recursiveness",
    americaness: "Americaness"
  }.freeze

  THRESHOLDS = {
    addictiveness: { high: 7, medium: 3, low: 0 },
    griftiness: { high: 7, medium: 3, low: 0 },
    emotiveness: { high: 7, medium: 3, low: 0 },
    recursiveness: { high: 7, medium: 3, low: 0 },
    americaness: { high: 7, medium: 3, low: 0 }
  }.freeze

  QUESTIONS = {
    addictiveness: [
      {
        text: "How long was this piece of content?",
        choices: [
          { label: "Less than 1 minute", score: 5 },
          { label: "Between 1 - 3 minutes", score: 3 },
          { label: "Between 3 - 5 minutes", score: 2 },
          { label: "Over 5 minutes", score: 1 }
        ]
      },
      {
        text: "Did you seek this content out or was it delivered to you?",
        choices: [
          { label: "I sought it out myself", score: 1 },
          { label: "It was delivered as part of a feed I subscribed to", score: 2 },
          { label: "It appeared on a feed without me having to do anything", score: 4 },
          { label: "The platform I consumed this on is one gigantic feed", score: 5 }
        ]
      }
    ],
    griftiness: [],
    emotiveness: [],
    recursiveness: [],
    americaness: []
  }.freeze

  def self.categories
    CATEGORIES
  end

  def self.questions_for(category)
    QUESTIONS.fetch(category)
  end

  def self.question_at(category, step)
    QUESTIONS.fetch(category)[step]
  end

  def self.question_count(category)
    QUESTIONS.fetch(category).size
  end

  def self.thresholds_for(category)
    THRESHOLDS.fetch(category)
  end

  def self.max_score_for(category)
    QUESTIONS.fetch(category).sum { |q| q[:choices].map { |c| c[:score] }.max }
  end

  def self.threshold_level(category, score)
    thresholds = thresholds_for(category)
    if score >= thresholds[:high]
      :high
    elsif score >= thresholds[:medium]
      :medium
    else
      :low
    end
  end
end
