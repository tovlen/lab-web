load 'lab5.rb'
require 'socket'
require 'rack'

server = TCPServer.new 3000
puts "Let`s go this bread"

while (connection = server.accept)

    cash_machine = CashMachine.new
    method = 'init'
    value = nil

    request = connection.gets
    next if request.nil?

    full_path = request.split(' ')
    next unless full_path[1].split('/')[1]

    path = full_path[1].split('/')[1]

    if !path.nil? && path.include?('?')

        method = path.split('?')[0]
        value = path.split('?')[1].split('=')[1].to_i

    elsif !path.nil?

        method = path

    end

    answer = "HTTP/1.1 200\r\nContent-Type: text/html\r\n\r\n<title>#{method}</title>"

    answer += case method

    when 'deposit'

        cash_machine.deposit(value).to_s

    when 'withdraw'

        cash_machine.withdrawn(value).to_s

    when 'balance'

        cash_machine.get_balance.to_s

    when 'init'

        'Oh, hello there, try go by link: <br>
        <a href="http://localhost:3000/get_balance">/get_balance</a><br>
        <a href="http://localhost:3000/deposit?value=200">/deposit?value=300</a><br>
        <a href="http://localhost:3000/withdraw?value=300">/withdraw?value=300</a><br>'

    else

        'Error, check the link.'

    end

    connection.print answer
    connection.close

end


