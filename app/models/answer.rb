# frozen_string_literal: true

# responsible for managing answers to questions against a username
# constraints:
#    - Answers are saved against a username key
#    - Save format for answers are:
#               [
#                { question_id: xx, score: xx },
#                { question_id: xx, score: xx }
#               ]
class Answer
  attr_accessor :username

  def initialize(username)
    @username = username
  end

  def save_new_answer(question_id, score)
    answer = if existing_answers.present?
               existing_answers.push(answer_hash(question_id, score))
             else
               [answer_hash(question_id, score)]
             end

    dalli_client.set(key: username, value: answer)
    answer
  end

  def existing_answers
    @existing_answers ||= dalli_client.get(key: username)
  end

  private

  def dalli_client
    @dalli_client ||= DalliClient.new
  end

  def answer_hash(question_id, score)
    {
      question_id:,
      score:
    }
  end
end
