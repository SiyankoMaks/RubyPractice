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
        file.close
        @balance = balance
    end

    def self.deposit(cash)
        cash = cash.to_f
        puts 'Введите сумму для начисления средств'
        if cash <= 0
            return "Input incorrect sum.\nSum must be more 0!\n\n"
        end
        @balance = @balance + cash
        puts "Добавлена сумма #{cash}"
        puts "Текущий баланс #{@balance}\n\n"
        file = File.open("balance.txt", "w")
        file.puts @balance
        file.close
        return @balance
    end

    def self.withdraw(cash)
        puts 'Введите сумму для снятия средств'
        cash = cash.to_f
        if cash <= 0 || cash > @balance
            return "Input incorrect sum.\nSum must be more 0 and lower sum in cashmachine!\n\n"
        end
        @balance = @balance - cash
        puts "Списана сумма #{cash}"
        puts "Текущий баланс #{@balance}\n\n"
        file = File.open("balance.txt", "w")
        file.puts @balance
        file.close
        return @balance
    end

    def self.tekBalance
        "Balance #{@balance}\n\n"
    end
end