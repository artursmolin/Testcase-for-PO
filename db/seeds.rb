require 'factory_bot_rails'

50.times do
	FactoryBot.create_list(:person, 10)
end
