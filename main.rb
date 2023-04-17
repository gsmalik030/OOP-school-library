require_relative 'app'
def main
  options = [
    "\n\nPlease choose an option by entering a bunber",
    '1 - List all books',
    '2 - List all people',
    '3 - create a person',
    '4 - create a book',
    '5 - create a rental',
    '6 - List all rental for a given person id',
    "7 - Exit \n\n"
  ]
  puts options
  input = gets.chomp.to_i
  while input != 7
    evaluate_options(input.to_i)
    puts options
    input = gets.chomp.to_i
  end
end

main
