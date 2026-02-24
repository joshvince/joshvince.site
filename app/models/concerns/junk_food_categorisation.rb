module JunkFoodCategorisation
  CATEGORIES = [ :addictiveness, :griftiness, :emotiveness, :recursiveness, :americaness ].freeze

  DISPLAY_NAMES = {
    addictiveness: "Addictive",
    griftiness: "Grift",
    emotiveness: "Emotive",
    recursiveness: "Recursive",
    americaness: "American"
  }.freeze

  THRESHOLDS = {
    addictiveness: { high: 7, medium: 3, low: 0 },
    griftiness: { high: 9, medium: 5, low: 0 },
    emotiveness: { high: 9, medium: 5, low: 0 },
    recursiveness: { high: 9, medium: 8, low: 0 },
    americaness: { high: 10, medium: 9, low: 0 }
  }.freeze

  ADVISORY_TEXTS = {
    addictiveness: "chance of addictive content or delivery mechanism.",
    griftiness: "likelihood the creator could be a grifter trying to manipulate you to buy something.",
    emotiveness: "chance the content is monetised based on you reacting negatively.",
    recursiveness: "chance this content will be or already has been automated by AI.",
    americaness: "levels of American Carnage detected."
  }.freeze

  QUESTIONS = {
    addictiveness: [
      {
        text: "How long was this piece of content?",
        choices: [
          { label: "Less than 1 minute", score: 5 },
          { label: "Between 1 - 3 minutes", score: 3 },
          { label: "Between 3 - 5 minutes", score: 2 },
          { label: "Over 5 minutes", score: 0 }
        ]
      },
      {
        text: "Did you seek this content out or was it delivered to you?",
        choices: [
          { label: "I sought it out myself", score: 0 },
          { label: "It was delivered as part of a channel or feed I subscribed to", score: 1 },
          { label: "It appeared on a feed without me having to do anything", score: 4 },
          { label: "The platform I consumed this on is one gigantic feed", score: 5 }
        ]
      }
    ],
    griftiness: [
      {
        text: "Did you pay for this piece of content?",
        choices: [
          { label: "I paid directly for this", score: 0 },
          { label: "I paid for an aggregator, service or subscription that includes this", score: 1 },
          { label: "I did not pay for this", score: 5 }
        ]
      },
      {
        text: "Did this content include adverts?",
        choices: [
          { label: "None at all", score: 1 },
          { label: "There were some overt ads separate from the actual content", score: 2 },
          { label: "There were no overt ads but it felt like I was being sold something", score: 5 }
        ]
      },
      {
        text: "Could you describe the creator of this content as an 'influencer'?",
        choices: [
          { label: "Yes", score: 5 },
          { label: "No", score: 0 },
          { label: "Sort of", score: 3 }
        ]
      }
    ],
    emotiveness: [
      {
        text: "How did you feel after you consumed this content?",
        choices: [
          { label: "Happy", score: 0 },
          { label: "Sad or depressed", score: 5 },
          { label: "Angry or enraged", score: 5 },
          { label: "Some other emotion", score: 0 },
          { label: "I felt nothing at all", score: 5 }
        ]
      },
      {
        text: "Is this content about a conflict, disagreement, scandal or outrage?",
        choices: [
          { label: "An armed conflict", score: 2 },
          { label: "A scandal", score: 5 },
          { label: "A political disagreement", score: 4 },
          { label: "An injustice", score: 4 },
          { label: "Something outrageous", score: 5 },
          { label: "None of the above", score: 0 }
        ]
      },
      {
        text: "Is one of the central figures in this content devisive in some way?",
        choices: [
          { label: "Oh yeah", score: 5 },
          { label: "Devisive? They are destroying the planet!", score: 5 },
          { label: "Politically for sure", score: 4 },
          { label: "No, not really", score: 0 }
        ]
      }
    ],
    recursiveness: [
      {
        text: "Is this fiction or non-fiction?",
        choices: [
          { label: "Fiction", score: 0 },
          { label: "Non-fiction", score: 3 }
        ]
      },
      {
        text: "Is this content commenting, reviewing or criticising something else?",
        choices: [
          { label: "Yes", score: 5 },
          { label: "Sort of, but it has an interesting take", score: 3 },
          { label: "No, it is about something new or original", score: 0 }
        ]
      },
      {
        text: "Do you think you could create this yourself, if you had a free afternoon?",
        choices: [
          { label: "Without doubt", score: 5 },
          { label: "Maybe, but I would need more resources", score: 3 },
          { label: "I am not that creative", score: 0 },
          { label: "No way", score: 0 }
        ]
      }
    ],
    americaness: [
      {
        text: "Is this content about something specifically American?",
        choices: [
          { label: "Yes", score: 2 },
          { label: "Kinda", score: 1 },
          { label: "No", score: 0 }
        ]
      },
      {
        text: "Is this about any of these specific topics?",
        choices: [
          { label: "American internal politics", score: 5 },
          { label: "America's geopolitics", score: 3 },
          { label: "The American justice system", score: 5 },
          { label: "American cultural disagreements", score: 5 },
          { label: "American techno-capital oligarchs", score: 3 },
          { label: "None of the above", score: 0 }
        ]
      },
      {
        text: "Are you American?",
        choices: [
          { label: "Yes", score: -5 },
          { label: "No but I live here", score: -5 },
          { label: "No", score: 5 }
        ]
      }
    ]
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

  def self.advisory_text_for(category)
    ADVISORY_TEXTS.fetch(category)
  end
end
