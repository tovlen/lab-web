#Фунция, для подтягивания данных из файла

def get_information(full_name)
    File.exist?(full_name)
    file = File.open(full_name)
    file_information = file.readlines.map(&:chomp)
    file.close
    file_information
end

#Метод для отбора студентов с указанным возрастом

def filter_students (age, information)

    i = 0
    result_filter = []
    while i < information.size() do
        if information[i].include? String(age)
            result_filter << information[i]
        end
        i = i + 1
    end 
    return result_filter

end

#Метод выводящий массив студентов в файл

def output(filter)
    
    File.exist?("result.txt")
    File.open("result.txt", "w") { |f| f.write filter}

end

def init

    flag = true
    while flag do
        puts "Enter your desired age: \n (To exit press -1)"
        age = gets.to_i
        if age == -1
            puts "Exit"
            flag = false 
            break
        else
            information = []
            filter = []
            i = 0
            
            information = get_information(List_of_students)
            filter = filter_students(age, information)
            if filter.empty?
                puts "No one was found for your request"
            elsif filter.size == 1
                puts "#{filter.size} The person was added"
            elsif filter.size > 1
                puts "#{filter.size} The people was added"
                output(filter)
                puts get_information("results.txt")
            elsif filter.size == (age)
                puts "All students was added"
                output(filter)
                break
            end
        end
    end
end 
List_of_students = "information.txt"
init
