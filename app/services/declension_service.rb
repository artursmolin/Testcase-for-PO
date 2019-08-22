# frozen_string_literal: true

class DeclensionService
  attr_reader :person, :first_name, :middle_name, :last_name

  def initialize(person)
    @person = person
    @first_name = Petrovich(firstname: person.first_name, gender: person.sex.to_sym)
    @middle_name = Petrovich(firstname: person.middle_name, gender: person.sex.to_sym)
    @last_name = Petrovich(firstname: person.last_name, gender: person.sex.to_sym)
  end

  # rubocop: disable Metrics/AbcSize
  # rubocop: disable Metrics/MethodLength
  def call
    {
      person_id: person.id,
      genitive: {
        last_name: genitive_last_name,
        first_name: first_name.genitive.to_s,
        middle_name: middle_name.genitive.to_s,
        full_name: genitive_last_name + ' ' +
          first_name.genitive.to_s + ' ' +
          middle_name.genitive.to_s
      },
      dative: {
        last_name: last_name.dative.to_s,
        first_name: first_name.dative.to_s,
        middle_name: middle_name.dative.to_s,
        full_name: last_name.dative.to_s + ' ' +
          first_name.dative.to_s + ' ' +
          middle_name.dative.to_s
      },
      accusative: {
        last_name: last_name.accusative.to_s,
        first_name: first_name.accusative.to_s,
        middle_name: middle_name.accusative.to_s,
        full_name: last_name.accusative.to_s + ' ' +
          first_name.accusative.to_s + ' ' +
          middle_name.accusative.to_s
      },
      instrumental: {
        last_name: last_name.instrumental.to_s,
        first_name: first_name.instrumental.to_s,
        middle_name: middle_name.instrumental.to_s,
        full_name: last_name.instrumental.to_s + ' ' +
          first_name.instrumental.to_s + ' ' +
          middle_name.instrumental.to_s
      },
      prepositional: {
        last_name: prepositional_last_name,
        first_name: first_name.prepositional.to_s,
        middle_name: middle_name.prepositional.to_s,
        full_name: prepositional_last_name + ' ' +
          first_name.prepositional.to_s + ' ' +
          middle_name.prepositional.to_s
      }
    }
  end

  def prepositional_last_name
    if person.sex.eql?('Male')
      last_name.prepositional.to_s
    else
      last_name.instrumental.to_s
    end
  end

  def genitive_last_name
    if person.sex.eql?('Male')
      last_name.genitive.to_s
    else
      last_name.instrumental.to_s
    end
  end
  # rubocop: enable Metrics/AbcSize
  # rubocop: enable Metrics/MethodLength
end
