# Написать скрипт, который будет принимать слово,
# если оно заканчивается на "CS" в любом регистре - вывести цифру 2 в степени длины слова
# иначе - вывести слово наоборот

require "rspec"

def wordScript(word)
    if word[-3, 2].upcase == "CS"
        puts 2**(word.size-1)
    else
        puts word.reverse
    end
end

puts 'Введите слово: '
word = gets.to_s
puts 'Результат: '
wordScript(word)

RSpec.describe "wordScript test" do
    it "#wordScript" do
        expect(wordScript("hCS")).to eq(puts 8)
    end
 end