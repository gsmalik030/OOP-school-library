class MakePerson
    @class_room = Classroom.new('Microverse')
    def initialize (age, name, input)
      @age =age
      @name = name
      @input = input
    end
    def get_person
      create_person
    end
  end