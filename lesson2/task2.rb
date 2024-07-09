# Написать скрипт, который будет выводить массив покемонов
# - спросит сколько добавить покемонов
# - указанное на предыдущем этапе число раз спросит имя и цвет каждого покемона
# - Выведет в консоль массив, содержащий хеши покемонов в формате имя - цвет
# Код должен быть организован в методы

require 'rspec'

def numPok()
    puts 'Введите количество покемонов'
    num = gets.to_i
    return num
end

def createPok(num)
    num = num.to_i
    pokemons = {}
    puts 'Введите имя и цвет для покемонов'
    while num > 0 do
        puts 'Имя: '
        name = gets.chomp
        puts 'Цвет: '
        color = gets.chomp
        pokemons[name] = color
        num = num - 1
        puts num
    end
    puts pokemons
end

def printPok(pokemons)
    puts pokemons
end

num = numPok()
pokemons = createPok(num.to_i)
printPok(pokemons)

RSpec.describe "createPok test" do
    name = "Pom"
    color = "Blue"
    it "#createPok" do
       expect(createPok(1)).to eq(puts "#{name}"=>"#{color}")
    end
 end