# Переписать банкомат из лз4 (класс CashMachine) на работу с веб сервером.
# Нужно заменить ввод и вывод данных(по условию изначальной задачи) на запросы,
# вместо работы с консолью
# GET /deposit?value=
# GET /withdraw?value=
# GET /balance

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

    def self.deposit(cash)
        cash = cash.to_f
        puts 'Введите сумму для начисления средств'
        if cash <= 0
            puts "Введена некорректная сумма.\nСумма должна быть положительной!\n\n"
            return @balance
        end
        @balance = @balance + cash
        puts "Добавлена сумма #{cash}"
        puts "Текущий баланс #{@balance}\n\n"
        return @balance
    end

    def self.withdraw(cash)
        puts 'Введите сумму для снятия средств'
        cash = cash.to_f
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
        "Текущий баланс #{@balance}\n\n"
    end
end

# CashMachine.init
# input_user = "unknown"
# while input_user.upcase != "Q"
#     puts "Выберите необходимую функцию:\nDeposit (d)\nWithdraw (w)\nBalance (b)\nQuit (q)\n\n"
#     input_user = gets.chomp
#     input_user = input_user.upcase
#     case input_user
#     when "D"
#         @balance = CashMachine.deposit
#     when "W"
#         @balance = CashMachine.withdraw
#     when "B"
#         CashMachine.tekBalance
#     when "Q"
#         puts 'Вы вышли из программы'
#         file = File.open("balance.txt", "w")
#         file.puts @balance
#         break
#     else
#         puts "Введена неккоректная команда.\nМожно использовать только команды d, w, b и q"
#     end
# end