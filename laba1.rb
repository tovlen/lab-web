class Greeting
    
    # метод приветствия со студентами

    def self.greeting(name, surname, age)
                
        answer = if age < 18
            
            "Oh, hello there, #{name} #{surname}. You are under 18, but it's never too early to learn to program! :з"
        
        else
            
            "Oh, hello there, #{name} #{surname}. It's time to get busy!"
        
        end
        
        return answer.gsub("\n", '')
    
    end

end

class Foobar
   
    # 2 числа сравниваются с 20, если одно из чисел == 20, то возвращается другое число
    # иначе возвращается их сумма

    def self.foobar (a,b)
        
        if a == 20
            
            b
        
        elsif b == 20
            
            a
        
        else
            
            a + b
        
        end
    
    end

end

def main 
    
    puts 'Enter your name'
    
    name = gets.chomp
    
    puts 'Enter your surname'
    
    surname = gets.chomp
    
    puts 'Enter your age' 
    
    age = gets.to_i

    puts Greeting.greeting(name, surname, age)
    
    puts Foobar.foobar(19,15)

end

main
