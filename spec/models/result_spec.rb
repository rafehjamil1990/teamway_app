# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Result do
  subject { Result.new(username) }

  let(:username) { 'Test User' }

  context '#result text' do
    before do
      # flush dali of previous data
      DalliClient.new.set(key: username, value: nil)
    end

    context 'when score is greater than INTROVERT threshold' do
      before do
        answer = Answer.new(username)
        answer.save_new_answer(1, 5)
        answer.save_new_answer(2, 5)
        answer.save_new_answer(1, 20)
      end

      it 'should return text as introvert' do
        expect(subject.result_text).to eq('introvert')
      end
    end

    context 'when score is less than INTROVERT threshold' do
      before do
        answer = Answer.new(username)
        answer.save_new_answer(1, 5)
        answer.save_new_answer(2, 5)
      end

      it 'should return text as extrovert' do
        expect(subject.result_text).to eq('extrovert')
      end
    end

    context 'when there are no answer saved against the username' do
      it 'should return 0 as a result' do
        expect(subject.result).to eq(0)
      end
    end
  end
end
