require 'rspec'
require_relative 'lab3_2.rb'

describe 'Method2' do
    
    it 'filter_students with one student' do
        
        information = []
        information << "Alexey Alekseev 30"
        age = 30
        expect(filter_students(age, information)).to eq ["Alexey Alekseev 30"]
    
    end

    it 'filter_students with several student' do
        
        information = []
        information = get_information("information.txt")
        age = 21
        expect(filter_students(age, information)).to eq ["Ivanov Ivan 21", "Nikolay Nikolaev 21"]
    
    end

    it 'filter_students with a person who is not suitable for the age category' do
        
        information = []
        information = get_information("information.txt")
        age = 11
        expect(filter_students(age, information)).to eq []
    
    end

end