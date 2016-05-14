require 'rspec'
require_relative '../lib/game'

describe Game do
  
  let (:game) { Game.new('ВАСИЛИСА') }
  let (:bad_letters) { %w(Б Г Д Е Ж З К) }
  let (:good_letters) { %w(В А С И Л) }
  let (:mixed_letters) { %w(В А С И Б Г Д Е Ж)}
  
  it 'status should return 1 when all the letters are guessed' do
    
    good_letters.each do |letter|
      game.evaluate(letter)      
    end
    
    expect(game.status).to eq (1)
  end
  
  it 'status should return -1 when 7 errors are made' do
    
    bad_letters.each do |letter|
      game.evaluate(letter)
    end
    
    expect(game.status).to eq (-1)
  end
  
  it 'status should return 0 when game is still in progress' do
    
    mixed_letters.each do |letter|
      game.evaluate(letter)
    end

    expect(game.status).to eq (0)
  end
  
end