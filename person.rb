class Person
    attr_accessor :name, :age
    attr_reader :id
  
    def initialize(age, name = 'Unknown', parent_permission: true)
      @id = Random.rand(1..100)
      @name = name,
      @age = age,
      @parent_permission = parent_permission
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
