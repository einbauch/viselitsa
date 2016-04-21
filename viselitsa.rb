require_relative 'win_cp_fix.rb'
require 'unicode'
require_relative 'game.rb'
require_relative 'result_printer.rb'
require_relative 'input_validator.rb'
require_relative 'word_reader.rb'


validator = InputValidator.new
result_printer = ResultPrinter.new
word_reader = WordReader.new
current_path = File.dirname(__FILE__)
words_file = current_path + "/data/wordlist.txt"

puts "Игра Виселица"
puts "Правила:"
puts "Вам необходимо отгадать загаданное слово вводя по одной букве за раз"
puts "Если введенная вами буква есть в слове, то она откроется"
puts "Если введенной вами буквы в слове нет, то вам засчитается ошибка"
puts "Для того, чтобы выиграть, необходимо отгадать все буквы в слове допустив не более 7 ошибок"
puts "Нажмите ENTER, если вы готовы начать"
gets

slovo = word_reader.read_from_file(words_file)
slovo = Unicode::upcase(slovo)

abort "Слово содержит недопустимые символы! Допустимы только буквы русского алфавита" unless validator.check_word?(slovo)

game = Game.new(slovo)

while game.status == 0 do

  result_printer.print_status(game)

  puts
  puts "Введите следующую букву"

  letter = ''

  until validator.check_letter?(letter) do
    letter = STDIN.gets.chomp.encode('UTF-8')
    letter = Unicode::upcase(letter)
    letter = 'И' if letter == 'Й'
    letter = 'Е' if letter == 'Ё'
  end

  game.evaluate(letter)

end

result_printer.print_status(game)