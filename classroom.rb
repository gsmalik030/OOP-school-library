class Classroom
  attr_accessor :lable, :students

  def initialize(lable)
    @lable = lable
    @students = []
  end

  def add_students(student)
    @students.push(student)
    student.owner = self
  end
end
