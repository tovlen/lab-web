#Банкомат, реализующий функции вывода баланса, внесения депозита
#снятия денег, а также выхода из меню банкомата
def balance
    defaulte_balance = 100

    if File.exists?("balance.txt")
        file = File.open("balance.txt")
        balance = Float(File.read("balance.txt")) 
    else
        balance = defaulte_balance
    end

    balance = Float(File.read("balance.txt")) || defaulte_balance

    loop do
        puts "
        Enter 'B' to check your balance \n 
        Enter 'D' to deposit money \n
        Enter 'W' to withdraw money \n 
        Enter 'Q' to exit "

        action = gets.chomp

        case action
            
        when "B"
            
            puts "Youre balance: #{balance}"

        when "D"

            puts "Enter the amount of the deposit: "
            amount_input = gets.to_i
            
            if amount_input < 0 
                puts "The amount of the deposit must be greater than 0 :c"
            else

                balance += amount_input
                puts "Youre balance: #{balance}"
                file = File.open('balance.txt')
                File.write("balance.txt", balance, mode: 'w')
                file.close

            end

        when "W"

            puts "Enter the amount to withdraw: "
            amount_output = gets.to_i
            if amount_output < 0
                puts "The withdrawn amount must be greater than 0 :c"
            elsif amount_output > balance
                puts "You are asking for an amount greater than your current balance!"
            else
                balance -= amount_output
                puts "Youre balance: #{balance}"
                file = File.open('balance.txt')
                File.write("balance.txt", balance, mode: 'w')
                file.close
            end

        when "Q"

            file = File.open('balance.txt')
            file.close
            
            break
        end
    end
end

def main 
    puts balance
end

main

