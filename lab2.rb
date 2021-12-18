# Метод, принимающий слово, если слово заканчивается на "cs", то выводит число, равное 2 в степени длины слова
# иначе выводит число задом наперёд

def endsWithCS(word)
    
    if (word[-2] + word[-1]) == "cs"
        
        number = 2 ** word.length
        
        puts "Word '#{word}', ends with 'cs', 2 to the power of word length: "
        
        return number
    
    else
        
        return word.reverse
    
    end

end

# Метод, выводящий массив покемонов, содержащий имя и цвет покемона

def counterOfPokemon
    
    puts "Enter the amount of pokemon"
    
    amount = gets.to_i
    
    arr = []
    
    i = 0
    
    while i < amount do
        
        puts "Enter the name #{i+1} of the pokemon: "
        
        name = gets.chomp
        
        puts "Enter the color #{i+1} of the pokemon: "
        
        color = gets.chomp
        
        pokemon = "name: #{name}, color: #{color} "
        
        arr << {pokemon => i}
       
        i += 1
    
    end
    
    return arr

end

def main
    
    puts endsWithCS ("astronautics")
    
    puts counterOfPokemon

end

main