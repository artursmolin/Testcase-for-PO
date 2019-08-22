# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PeopleController do
  let(:person) { FactoryBot.create(:person) }

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET show' do
    it 'has a 200 status code' do
      get :show, params: { id: person.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'GET new' do
    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe 'GET edit' do
    it 'has a 200 status code' do
      get :edit, params: { id: person.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'POST create' do
    before(:each) do
      person = Person.new(
        first_name: Faker::Name.name,
        last_name: Faker::Name.last_name,
        middle_name: Faker::Name.middle_name,
        sex: Faker::Demographic.sex
      )
    end

    it 'creates person' do
      post :create, params: { person: {
        first_name: person.first_name,
        last_name: person.last_name,
        middle_name: person.middle_name,
        sex: person.sex
      } }
      expect(response).to redirect_to(people_path)
    end

    it 'can not creates person' do
      post :create, params: { person: {
        first_name: nil,
        last_name: person.last_name,
        middle_name: person.middle_name,
        sex: person.sex
      } }
      expect(response.status).to eq(200)
    end
  end

  describe 'PUT update' do
    it 'updates person' do
      put :update, params: { person: { first_name: 'Any Name' }, id: person.id }
      expect(person.reload.first_name).to eq('Any Name')
      expect(response).to redirect_to(Person.last)
    end

    it 'update person with invalid' do
      put :update, params: { person: { first_name: nil }, id: person.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE destroy' do
    it 'deletes person' do
      delete :destroy, params: { id: person.id }
      expect(response).to redirect_to(people_path)
      expect(Person.count).to eq(0)
    end
  end
end
