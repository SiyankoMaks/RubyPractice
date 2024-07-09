require 'rspec'

def greeting(name, surname, age)
   if age<18
      puts "Привет, #{name} #{surname}. Тебе меньше 18, можно начинать учиться программировать"
   else
      puts "Привет, #{name} #{surname}, Самое время работать."
   end
end

puts "Введите имя, фамилию и возраст"
name = gets.chomp
surname = gets.chomp
age = gets.to_i
greeting(name, surname, age)

#  Тесты
RSpec.describe "greeting test" do
   it "#greeting" do
      expect(greeting("Maks", "Si", 20)).to eq(puts "Привет, Maks Si, Самое время работать.")
   end
end