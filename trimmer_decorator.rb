require_relative 'person'

require_relative 'base_decorator'

require_relative 'capitalize_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    super().slice(0, 10)
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(person)
puts capitalized_trimmed_person.correct_name
