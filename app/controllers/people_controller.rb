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
      redirect_to people_path, notice: 'Person was successfully created.'
    else
      render :new
    end
  end

  def update
    if @person.update(person_params)
      redirect_to @person, notice: 'Person was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @person.destroy
    redirect_to people_url, notice: 'Person was successfully destroyed.'
  end

  private

  def set_person_and_declensions
    @person = Person.find(params[:id])
    @declensions = @person.declensions
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :middle_name, :sex, :fullname)
  end
end
