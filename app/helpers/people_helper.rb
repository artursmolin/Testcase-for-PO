# frozen_string_literal: true

module PeopleHelper
  def person_params(declension, value)
    declension.to_s.capitalize.gsub(/_/, ' ') + ': ' + value
  end
end
