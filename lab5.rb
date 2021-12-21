class CashMachine
    
    PATH_BALANCE = "balance.txt"
    DEFAULT_BALANCE = 100

    def initialize
        if File.exist?(PATH_BALANCE)
            @balance = File.read(PATH_BALANCE).to_i
            raise TypeError, 'Balance is incorrect!' unless (@balance.kind_of?(Integer))
        else
            @balance = DEFAULT_BALANCE
        end
        
    end

    def balance

        @balance

    end

    def get_balance

        "Your balance:  #{@balance}"

    end

    def deposit(amount_input)

        if amount_input < 0

            'The deposit must be greater than 0.'

        else

            @balance += amount_input

            "Your balance:  #{@balance}"

        end

    end

    def withdrawn(amount_output)


        if amount_output > @balance

            'Withdrawal amount must be less than the current balance!'
            
        elsif amount_output < 0 

            'Withdrawal amount must be greater than 0.'

        else 

            @balance -= amount_output

            "Your balance:  #{@balance}"

        end

    end
    
end


