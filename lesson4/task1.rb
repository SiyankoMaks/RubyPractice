# Переписать банкомат из лз3 на работу с классами
# Класс должен называться CashMachine.
# Программа должна запускаться с помощью метода класса init,
# создать экземпляр класса и взаимодействовать с пользователями согласно условиям задачи

class CashMachine


    def self.init
        const = 100.0

        if File.exist?("balance.txt")
            file = File.open("balance.txt", "r")
            balance = file.read
            balance = balance.to_f
        else
            file = File.new("balance.txt", "w")
            file.puts const
            balance = const
        end
        @balance = balance
    end

    def self.deposit
        puts 'Введите сумму для начисления средств'
        cash = gets.to_f
        if cash <= 0
            puts "Введена некорректная сумма.\nСумма должна быть положительной!\n\n"
            return @balance
        end
        @balance = @balance + cash
        puts "Добавлена сумма #{cash}"
        puts "Текущий баланс #{@balance}\n\n"
        return @balance
    end

    def self.withdraw
        puts 'Введите сумму для снятия средств'
        cash = gets.to_f
        if cash <= 0 || cash > @balance
            puts "Введена некорректная сумма.\nСумма должна быть положительной и не больше текущего баланса!\n\n"
            return @balance
        end
        @balance = @balance - cash
        puts "Списана сумма #{cash}"
        puts "Текущий баланс #{@balance}\n\n"
        return @balance
    end

    def self.tekBalance
        puts "Текущий баланс #{@balance}\n\n"
    end
end

CashMachine.init
input_user = "unknown"
while input_user.upcase != "Q"
    puts "Выберите необходимую функцию:\nDeposit (d)\nWithdraw (w)\nBalance (b)\nQuit (q)\n\n"
    input_user = gets.chomp
    input_user = input_user.upcase
    case input_user
    when "D"
        @balance = CashMachine.deposit
    when "W"
        @balance = CashMachine.withdraw
    when "B"
        CashMachine.tekBalance
    when "Q"
        puts 'Вы вышли из программы'
        file = File.open("balance.txt", "w")
        file.puts @balance
        break
    else
        puts "Введена неккоректная команда.\nМожно использовать только команды d, w, b и q"
    end
end
