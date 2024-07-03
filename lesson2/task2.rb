# Написать скрипт, который будет выводить массив покемонов
# - спросит сколько добавить покемонов
# - указанное на предыдущем этапе число раз спросит имя и цвет каждого покемона
# - Выведет в консоль массив, содержащий хеши покемонов в формате имя - цвет
# Код должен быть организован в методы

def numPok()
    puts 'Введите количество покемонов'
    num = gets.to_i
    puts num
end

def createPok(num)
    pokemons = {}
    puts 'Введите имя и цвет для покемонов'
    while num.to_i >= 0 do
        puts num
        puts 'Имя: '
        name = gets.chomp
        puts 'Цвет: '
        color = gets.chomp
        pokemons[name] = color
        num = num.to_i - 1
    end
    puts pokemons
end

def printPok(pokemons)
    puts pokemons
end

num = numPok()
pokemons = createPok(num)
printPok(pokemons)