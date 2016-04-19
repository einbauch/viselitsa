class InputValidator

  ALPHABET = "ЙЦУКЕНГШЩЗХЪЁФЫВАПРОЛДЖЭЯЧСМИТЬБЮ".split("") #Создаем алфавит (допустимые символы)

  def check_word?(word) # проверяем все ли символы в слове входят в наш алфавит, возвращаем true или false

    return false if word == ''

    letters = word.split("")

    ALPHABET.sort & letters.uniq.sort == letters.uniq.sort
   
  end

  def check_letter?(letter) #проверяем хводит ли буква в наш алфавит, возвращаем true или false
    
    ALPHABET.include?(letter)

  end

end

