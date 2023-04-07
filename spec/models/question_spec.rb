# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question do
  subject { described_class.new(id:) }

  let(:id) { nil }

  context 'When initializing class' do
    it 'should load all available questions' do
      question = subject
      expect(question.available_questions.size).to eq(5)
    end

    context 'with nil arguments' do
      it 'should set current question with id 1' do
        question = subject
        expect(question.id).to eq(1)
      end
    end

    context 'with id as an argument' do
      let(:id) { 2 }

      it 'should set current question with id 2' do
        question = subject
        expect(question.id).to eq(2)
      end
    end
  end

  context '#next_question' do
    it 'should move to next question' do
      question = subject
      question.next_question
      expect(question.id).to eq(2)
    end
  end

  context '#prev_question' do
    let(:id) { 2 }

    it 'should move to prev question' do
      question = subject
      question.prev_question
      expect(question.id).to eq(1)
    end
  end
end
