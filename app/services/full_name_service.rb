# frozen_string_literal: true

class FullNameService
  def call(person)
    person.last_name + ' ' + person.first_name + ' ' + person.middle_name
  end

  def declensions(hash)
    hash[:last_name] + + hash[:first_name] + + hash[:middle_name]
  end
end
