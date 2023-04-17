require_relative 'student'
require_relative 'teacher'

class AllPeople
  attr_accessor :peoplelist

  @class_room = Classroom.new('Microverse')
  def initialize
    @peoplelist = []
  end

  def add_person(option)
    if [1, 2].include?(option)
      print 'age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      case option
      when 1
        print 'Has parent permission [Y/N]: '
        permission = gets.chomp
        permission = permission.upcase == 'Y'
        student = Student.new(age, @class_room, name, permission)
        @peoplelist.push(student)
        puts 'Person created  successfully'
      when 2
        print 'Specialization: '
        specialization = gets.chomp
        teacher = Teacher.new(age, specialization, name)
        @peoplelist.push(teacher)
        puts 'Person created  successfully'
      end
    else
      puts 'Invalid input'
    end
  end
end
