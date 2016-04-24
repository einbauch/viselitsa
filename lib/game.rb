class Game

  attr_reader :letters, :good_letters, :bad_letters, :errors_count, :status

  def initialize(word)
    @letters = get_letters(word)
    @errors_count = 0
    @bad_letters = []
    @good_letters = []
    @status = 0 # 0 - в процессе, -1 - проигрыш, 1 - выигрыш
  end

  def get_letters(word)
    abort "Вы не ввели слово для игры" if (word == nil || word == "")
    word.split("")
  end

  def evaluate(letter)
    return unless @status == 0
    return if @good_letters.include?(letter) || @bad_letters.include?(letter)

    if is_good?(letter)
      add_letter_to(@good_letters,letter)
      @status = 1 if word_solved?
    else
      add_letter_to(@bad_letters,letter)
      @errors_count += 1
      @status = -1 if @errors_count >= 7
    end
  end

  private

  def add_letter_to(letters,letter)
    letters << letter
    letters << 'Й' if letter == 'И'
    letters << 'Ё' if letter == 'Е'
  end

  def is_good?(letter)
    @letters.include?(letter) ||
    @letters.include?('Й') && letter == 'И' ||
    @letters.include?('Ё') && letter == 'Е'
  end

  def word_solved?
    @good_letters.sort & @letters.uniq.sort == @letters.uniq.sort
  end

end