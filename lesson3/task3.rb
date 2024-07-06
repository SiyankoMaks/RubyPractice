# Напишите программу, которая считывает файл balance.txt
# Он содержит одну строку со стартовым балансом клиента
# Если файла нет, то стартовый баланс 100.0 (константа)

# После программа предлагает клиенту внести деньги, вывести,проверить баланс или выйти, используя буквы D(deposit), W(withdraw), B(balance) и Q(quit).
# Программа должна принимать на вход значения в верхнем или нижнем регистре.

# Для депозитов (D), программа подсказывает сумму.
# Она больше 0. Если сумма действительна, программа добавляет сумму депозита к балансу клиента и отображает новый баланс.

# При снятии средств (W) программа выдает запрос на сумму.
# Она больше 0 и <= текущему балансу. Если сумма корректна, то вычитается сумма вывода из баланса клиента и отображает новый.

# Для проверки баланса (B) программа выводит текущий баланс.

# Если клиент выходит из программы (Q), программа запишет текущий баланс обратно в файл balance.txt.

# В случае неправильного ввода (комманда или сумма), выдается соответствующее сообщение об ошибке, с указанием, как ее исправить.

def deposit(balance)
    puts 'Введите сумму для начисления средств'
    cash = gets.to_f
    if cash <= 0
        puts "Введена некорректная сумма.\nСумма должна быть положительной!\n\n"
        return balance
    end
    balance = balance + cash
    puts "Добавлена сумма #{cash}"
    puts "Текущий баланс #{balance}\n\n"
    return balance
end

def withdraw(balance)
    puts 'Введите сумму для снятия средств'
    cash = gets.to_f
    if cash <= 0 || cash > balance
        puts "Введена некорректная сумма.\nСумма должна быть положительной и не больше текущего баланса!\n\n"
        return balance
    end
    balance = balance - cash
    puts "Списана сумма #{cash}"
    puts "Текущий баланс #{balance}\n\n"
    return balance
end

def tekBalance(balance)
    puts "Текущий баланс #{balance}\n\n"
end

BALANCE = "balance.txt"
const = 100.0
input_user = "unknown"

if File.exist?("balance.txt")
    file = File.open("balance.txt", "r")
    balance = file.read
    balance = balance.to_f
else
    file = File.new("balance.txt", "w")
    file.puts const
    balance = const
end

while input_user.upcase != "Q"
    puts "Выберите необходимую функцию:\nDeposit (d)\nWithdraw (w)\nBalance (b)\nQuit (q)\n\n"
    input_user = gets.chomp
    input_user = input_user.upcase
    case input_user
    when "D"
        balance = deposit(balance)
    when "W"
        balance = withdraw(balance)
    when "B"
        tekBalance(balance)
    when "Q"
        puts 'Вы вышли из программы'
        file = File.open("balance.txt", "w")
        file.puts balance
        break
    else
        puts "Введена неккоректная команда.\nМожно использовать только команды d, w, b и q"
    end
end