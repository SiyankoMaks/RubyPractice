require "socket"
require "./task"

server = TCPServer.open('0.0.0.0', 8080)

while connection = server.accept
    request = connection.gets

    method, full_path, protocol = request.split(" ")

    path, params = full_path.split("?")

    puts method, path, protocol, params
    response = case path
    when "/"
        balance = CashMachine.init
        "#{balance}"
        puts balance
    when "/Deposit"
        'Input deposit sum'
        cash = params.to_f
        CashMachine.deposit(cash)
    when "/Withdraw"
        'Input withdraw sum'
        cash = params.to_f
        CashMachine.withdraw(cash)
    when "/Balance"
        "Balance: #{balance}\n\n"
    else
        "404"
    end

    status = response == "404" ? "404" : "200"

    connection.print "HTTP/1.1 #{status}\r\n"
    connection.print "Content-Type: text/html\r\n"
    connection.print "\r\n"
    connection.print response
    
    connection.close
end