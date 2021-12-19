Students_List = 'information.txt'
Buffer = 'resulting.txt'

def index 
    File.foreach(Students_List).with_index do |student, index|
        @student_id = index if student.include?(pattern)
    end
    @student_id
end

def update(id, txt)
    file = File.open (Buffer, 'w')

    File.foreach(Students_List).with_index do |student, index|
        file.puts(id == index ? txt : student)
    end

    file.close
    File.write(Students_List, File.read(Buffer))

    File.delete(Buffer) if File.exist?(Buffer)

end

def delete(id)
    file = File.open(Buffer, 'w')
    File.foreach(Students_List).with_index do |student, index|
        file.puts student if id != index
    end

    file.close
    File.write(Students_List, File.read(Buffer))

    File.delete(Buffer) if File.exist?(Buffer)

end

def find(id)
    File.foreach(Students_List).with_index do |student, index|
        puts student if id == index
    end
end


