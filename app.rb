require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'person'
require_relative 'all_people'

@class_room = Classroom.new('microverse_one')
@persons = []
@books = []
@rentals = []
@allpeople = AllPeople.new

def list_all_books
  @books.each_with_index do |book, index|
    puts "#{index} Title: \"#{book.title}\", Author: \"#{book.author}\""
  end
end

def evaluate_options(option)
  case option
  when 1
    list_all_books
  when 2
    list_all_people
  when 3
    puts create_person
  when 4
    puts create_book
  when 5
    puts create_rental
  when 6
    puts list_all_rentals
  else
    puts "Please enter a valid option\n"
  end
end

def list_all_people
  print "people list is empty. Please add some people!\n" if @allpeople.peoplelist.empty?
  @allpeople.peoplelist.each_with_index do |person, index|
    puts "#{index} [#{person.class}] Name: #{person.name}, Id: #{person.id}, age: #{person.age},"
  end
end

def create_person
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
  input = gets.chop.to_i
  @allpeople.add_person(input)
end

def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  @books.push(Book.new(title, author))
  puts 'Book created successfuly'
end

def create_rental
  puts 'Select a book from the following list by number'
  list_all_books
  book_id = gets.chomp
  book = nil
  book = @books[book_id.to_i] if book_id.to_i.to_s == book_id &&
                                 book_id.to_i < @books.length
  puts 'Select a person from the following list by number (not id)'
  list_all_people
  person = nil
  person_id = gets.chomp
  person = @allpeople.peoplelist[person_id.to_i] if person_id.to_i.to_s ==
                                                    person_id && person_id.to_i < @allpeople.peoplelist.length
  if book && person
    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, book, person))
    puts 'Rental created successfuly'
  else
    puts 'invalid person or book ID'
  end
end

def list_all_rentals
  print 'ID of person: '
  id = gets.chomp
  person = @allpeople.peoplelist.filter { |per| per.id == id.to_i }
  if person.length.positive?
    person = person[0]
    @rentals.each do |rent|
      puts "date: #{rent.date}, Book: \"#{rent.book.title}\" by #{rent.book.author}" unless rent.person.id != person.id
    end
  else
    puts 'No person found with that ID'
  end
  ''
end
