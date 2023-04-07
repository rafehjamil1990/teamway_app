# frozen_string_literal: true

# responsible for calculating results against a username chosen answers
class Result
  attr_reader :username, :result

  INTROVERT_THRESHOLD = 20

  def initialize(username)
    @username = username
    @result   = 0
    calculate_result
  end

  def result_text
    return 'introvert' if result > INTROVERT_THRESHOLD

    'extrovert'
  end

  private

  def calculate_result
    answers = dalli_client.get(key: username)
    return if answers.nil?

    @result = answers.sum { |a| a[:score] }
  end

  def dalli_client
    @dalli_client ||= DalliClient.new
  end
end
