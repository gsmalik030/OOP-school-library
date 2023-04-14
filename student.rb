require_relative 'person'
# This a Student class
class Student < Person
  attr_accessor :classroom

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, classroom, name = 'Unknown', parent_permission = true)
    # rubocop:enable Style/OptionalBooleanParameter
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '"¯\(ツ)/¯"'
  end

  # setter
  def update_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
person = Student.new(14, 'persone_one', false)
puts person.can_use_services?
