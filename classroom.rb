class Classroom
  attr_accessor :lable, :students

  def initialize(lable)
    @lable = lable
    @students = []
  end

  def add_students(student)
    @student.push(student)
    student.update_classroom(self)
  end
end
