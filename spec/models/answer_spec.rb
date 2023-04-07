# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer do
  subject { Answer.new(username) }

  let(:username) { 'Test User' }
  let(:answer_hash) do
    {
      question_id:,
      score:
    }
  end
  let(:question_id) { 1 }
  let(:score) { 5 }

  before do
    # flush dali of previous data
    DalliClient.new.set(key: username, value: nil)
  end

  context '#save_new_answer' do
    it 'should save answer using dalli_client' do
      expect(subject.save_new_answer(question_id, score)).to eq([answer_hash])
    end
  end

  context '#existing_answers' do
    before do
      subject.save_new_answer(question_id, score)
    end

    it 'should fetch existing answers' do
      expect(subject.existing_answers).to eq([answer_hash])
    end
  end
end
