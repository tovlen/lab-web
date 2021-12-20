class CashMachine
    
    def self.initial 
        
        def initialize
            
        if File.exist?(PATH_BALANCE)
            
            @balance = File.read(PATH_BALANCE).to_i
            raise TypeError, 'Balance is incorrect!' unless (@balance.kind_of?(Integer))
            
        else
            
            @balance = DEFAULT_BALANCE
            
        end
            
    init
            
    end  
            
    end

    def balance

        puts "Your balance:  #{@balance}"

    end

    def deposit(amount_input)

        amount_input = gets.to_i
        if amount_input < 0 

            puts "The deposit must be greater than 0."

        else

            @balance += amount_input
            file = File.open('balance.txt')
            File.write("balance.txt", balance, mode: 'w')
            file.close

        end

    end

    def withdrawn(amount_output)

        amount_output = gets.to_i
        if amount_output > @balance

            puts "Withdrawal amount must be less than the current balance!"
            
        elsif amount_output < 0 

            puts "Withdrawal amount must be greater than 0."

        else 

            @balance -= amount_output
            file = File.open('balance.txt')
            File.write("balance.txt", balance, mode: 'w')
            file.close

        end

    end

    def quit 

        file = File.open("balance.txt", "w")
        File.write(balance)
        file.close

    end


    def init
        
        #CashMachine.initial
        atm = CashMachine.new
        loop do

            puts "
            Enter 'B' to check your balance \n 
            Enter 'D' to deposit money \n
            Enter 'W' to withdraw money \n 
            Enter 'Q' to exit "

            action = gets.chomp

            case action
                    
            when "B"
                    
                atm.balance

            when "D"

                puts "Enter the amount to deposit: "
                atm.deposit(gets.to_i)

            when "W"

                puts "Enter the amount to withdraw: "
                atm.withdrawn(gets.to_i)

            when "Q"

                atm.quit
                break

            end
        
        end
        
    end
    
end
