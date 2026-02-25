class JunkFood < ApplicationRecord
  RESERVED_NAMES = [
    "junk food firehose",
    "the junk food firehose",
    "junk food",
    "this website",
    "this site",
    "this app",
    "this page",
    "this tool",
    "junkfoodfirehose",
    "firehose",
    "the firehose",
    "josh vince",
    "joshvince.site",
    "josh vince's site"
  ].freeze

  validates :name, presence: true, length: { minimum: 3, maximum: 35 }
  validate :not_a_reserved_name
  validate :no_html_in_name

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

  private

  def no_html_in_name
    return if name.blank?

    if name != ActionController::Base.helpers.strip_tags(name)
      errors.add(:name, "Nice try. Try something else you berk.")
    end
  end

  def not_a_reserved_name
    return if name.blank?

    if RESERVED_NAMES.include?(name.strip.downcase)
      errors.add(:name, "Nice try. Try something else you berk.")
    end
  end
end
