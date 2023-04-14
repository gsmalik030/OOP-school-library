require_relative 'nameable'
# This a Person class
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = 'Unknown', parent_permission = true)
    # rubocop:enable Style/OptionalBooleanParameter
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    if isof_age? || @parent_permission
      true
    else
      false
    end
  end

  private

  def isof_age?
    @age >= 18
  end
end
