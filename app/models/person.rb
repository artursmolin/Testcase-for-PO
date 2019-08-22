# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :declensions, dependent: :destroy

  validates :first_name, presence: true
  validates :full_name, presence: true
  validates :sex, presence: true
end
