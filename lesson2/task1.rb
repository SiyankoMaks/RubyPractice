# Написать скрипт, который будет принимать слово,
# если оно заканчивается на "CS" - вывести цифру 2 в степени длины слова
# иначе - вывести слово наоборот

def wordScript(word)
    if word[-3, 2] == "CS"
        puts 2**(word.size-1)
    else
        puts word.reverse
    end
end

puts 'Введите слово: '
word = gets.to_s
puts 'Результат: '
wordScript(word)