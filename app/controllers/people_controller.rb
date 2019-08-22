# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :set_person_and_declensions, only: %i[show edit update destroy]

  def index
    @people = Person.all
  end

  def show; end

  def new
    @person = Person.new
  end

  def edit; end

  def create
    @person = Person.new(person_params)
    @person.full_name = FullNameService.new.call(@person)
    @person.save
    declensions = Declension.new(DeclensionService.new(@person).call)
    if declensions.save
      redirect_to people_path
    else
      render :new
    end
  end

  def update
    if @person.update(person_params)
      @declensions.update(DeclensionService.new(@person).call)
      redirect_to @person
    else
      render :edit
    end
  end

  def destroy
    @person.destroy
    redirect_to people_url
  end

  private

  def set_person_and_declensions
    @person = Person.find(params[:id])
    @declensions = Declension.find_by(person_id: @person.id)
  end

  def person_params
    params[:person][:sex] = if params[:person][:sex].eql?('Мужской')
                              'Male'
                            else
                              'Female'
                            end
    params.require(:person).permit(:first_name, :last_name, :middle_name, :sex, :fullname)
  end
end
