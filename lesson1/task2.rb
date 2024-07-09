require 'rspec'

def foobar(num1, num2)
    if num1==20 or num2==20
        return num2
    else
        return num1+num2
    end
end

puts "Введите два числа "
num1 = gets.to_i
num2 = gets.to_i
puts foobar(num1, num2)

RSpec.describe "foobar test" do
    it "#foobar" do
        expect(foobar(10, 15)).to eq(25)
    end
end