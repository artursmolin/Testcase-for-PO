require 'factory_bot_rails'

5.times do
	person = FactoryBot.create(:person)
	Declension.create(DeclensionService.new(person).call)
end
