class ResultPrinter

  def initialize
    @status_image = []

    current_path = File.dirname(__FILE__)

    (0..9).each do |i|

      file_name = current_path + "/../image/#{i}.txt"

      begin
        f = File.new(file_name,"r:UTF-8")
        @status_image << f.read
        f.close
      rescue Errno::ENOENT
        @status_image << "\n[ Изображение не найдено ]\n"
      end

    end

  end

  def print_status(game)
    cls
    puts "\nСлово: #{get_word_for_print(game.letters,game.good_letters)}"
    puts "Ошибки (#{game.errors_count}): #{game.bad_letters.join(", ")}"
  
    print_viselitsa(game.errors_count)
    

    case game.status
    when -1
      cls
      puts "Вы проиграли :("
      puts "Загаданное слово: #{game.letters.join("")}"
      puts
      puts @status_image[9]
    when 1
      puts "Поздравляем, вы красавчик!"
      puts 
      puts @status_image[8]
    when 0 
      puts "У вас осталось попыток: #{7 - game.errors_count}"
    end
  end

  def get_word_for_print(letters,good_letters)
    result = ""

    letters.each { |letter|
      if good_letters.include? letter
        result += letter + " "
      else
        result += "__ "
      end
    }

    result
  end

  def print_viselitsa(errors)
    
    puts @status_image[errors]

  end

  def cls
    system "clear" or system "cls"
  end

end
