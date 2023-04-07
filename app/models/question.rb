# frozen_string_literal: true

# responsible for loading new questions from yml file and displaying them
# Assumption: (to keep the classes simple)
#       - in questions.yml file question ids will always be incremental starting from 1.
#       - in questions.yml file question ids can not skip a id e.g ids will always be like this 1, 2, 3, 4
class Question
  attr_accessor :available_questions
  attr_reader :id

  def initialize(id: nil)
    @id = id || 1
    load_questions
  end

  def current_question
    @current_question ||= @available_questions.filter { |_q, q_detail| q_detail['id'] == id }
  end

  def next_question
    @id += 1
    @current_question = nil
    current_question
  end

  def prev_question
    @id -= 1 if id > 1
    @current_question = nil
    current_question
  end

  def title
    current_question.keys.first.titleize
  end

  def options
    question_details['options']
  end

  def description
    question_details['text']
  end

  private

  def question_details
    current_question.values.first
  end

  def load_questions
    @available_questions = YAML.load_file(
      File.join(Rails.root, 'config', 'questions.yml')
    ).with_indifferent_access
  end
end
