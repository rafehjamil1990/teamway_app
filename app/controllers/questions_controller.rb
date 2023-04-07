# frozen_string_literal: true

# responsible for managing/displaying questions
class QuestionsController < ApplicationController
  before_action :check_username, except: :create
  before_action :current_question

  def show; end

  def create
    session['username'] = params[:username]

    redirect_to_next
  end

  def result
    @result = Result.new(current_username)
  end

  def start_over
    DalliClient.new.set(key: current_username, value: nil)
    session['username'] = nil

    redirect_to root_path
  end

  def save_answer
    @answer = Answer.new(current_username)
    @answer.save_new_answer(current_question.id, params[:options].to_i)
    current_question.next_question
    redirect_to_next
  end

  private

  def redirect_to_next
    if current_question.current_question.present?
      redirect_to question_path(current_question.id)
    else
      redirect_to result_questions_path
    end
  end

  def current_question
    @current_question ||= Question.new(id: params[:id]&.to_i)
  end

  def current_question_id
    @current_question_id ||= current_question.id
  end
end
