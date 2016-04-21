class Game

  def initialize(slovo)
    @letters = get_letters(slovo)
    @errors_count = 0
    @bad_letters = []
    @good_letters = []
    @status = 0 # 0 - в процессе, -1 - проигрыш, 1 - выигрыш
  end

  def get_letters(slovo)
    abort "Вы не ввели слово для игры" if (slovo == nil || slovo == "")
    slovo.split("")
  end

  def evaluate(letter)
    return unless @status == 0
    return if @good_letters.include?(letter) || @bad_letters.include?(letter)

    if @letters.include?(letter) || @letters.include?('Й') && letter == 'И' || @letters.include?('Ё') && letter == 'Е'
      @good_letters << letter
      @good_letters << 'Й' if letter == 'И'
      @good_letters << 'Ё' if letter == 'Е'

      if @good_letters.sort & @letters.uniq.sort == @letters.uniq.sort
        @status = 1
      end

    else
      @bad_letters << letter
      @bad_letters << 'Й' if letter == 'И'
      @bad_letters << 'Ё' if letter == 'Е'
      @errors_count += 1
      @status = -1 if @errors_count >= 7
    
    end

  end

  def letters
    @letters
  end

  def good_letters
    @good_letters
  end

  def bad_letters
    @bad_letters
  end

  def errors_count
    @errors_count
  end

# 0 - в процессе, -1 - проигрыш, 1 - выигрыш
  def status
    @status
  end

end