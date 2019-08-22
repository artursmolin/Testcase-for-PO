# frozen_string_literal: true

FactoryBot.define do
	Faker::Config.locale = :ru
	sex = Faker::Demographic.sex 
	if sex == 'Male'
  	factory :person do
  		sex { sex }
    	first_name { Faker::Name.male_first_name }
    	last_name { Faker::Name.male_last_name }
    	middle_name { Faker::Name.male_middle_name }
    	full_name { first_name + last_name + middle_name }
    end
  else
  	factory :person do
  		sex { sex }
    	first_name { Faker::Name.female_first_name }
    	last_name { Faker::Name.female_last_name }
    	middle_name { Faker::Name.female_middle_name }
    	full_name { first_name + last_name + middle_name }
    end
  end
end
