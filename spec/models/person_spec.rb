# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) { FactoryBot.create(:person) }

  it 'is valid with valid attributes' do
    expect(person).to be_valid
  end

  context 'with blank first_name' do
    let(:person) { build(:person, first_name: '') }

    it 'is invalid without first_name' do
      expect(person).to be_invalid
      expect(person.errors.messages).to include(:first_name)
    end
  end

  context 'with blank last_name' do
    let(:person) { build(:person, last_name: '') }

    it 'is invalid without last_name' do
      expect(person).to be_valid
    end
  end

  context 'with blank middle_name' do
    let(:person) { build(:person, middle_name: '') }

    it 'is invalid without  middle_name' do
      expect(person).to be_valid
    end
  end

  context 'with blank full_name' do
    let(:person) { build(:person, full_name: '') }

    it 'is invalid without full_name' do
      expect(person).to be_invalid
      expect(person.errors.messages).to include(:full_name)
    end
  end

  context 'with blank sex' do
    let(:person) { build(:person, sex: '') }

    it 'is invalid without sex' do
      expect(person).to be_invalid
      expect(person.errors.messages).to include(:sex)
    end
  end
end
