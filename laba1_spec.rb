require 'rspec'

require_relative 'laba1'

RSpec.describe "Greeting" do

    it 'When the age is the less then 18' do
       
        expect(Greeting.greeting("Vladimir", "Subbotin", 17)).to eq"Oh, hello there, Vladimir Subbotin. You are under 18, but it's never too early to learn to program! :з"
    
    end
    
    it 'When the age is the more then 18' do
       
        expect(Greeting.greeting("Vladimir", "Subbotin", 19)).to eq"Oh, hello there, Vladimir Subbotin. It's time to get busy!"
    
    end

end

RSpec.describe "Foobar" do

    it 'If one of the numbers is equal to twenty' do
       
        expect(Foobar.foobar(20, 17)).to eq 17
    
    end
    
    it 'If one of the numbers is not equal to twenty' do
       
        expect(Foobar.foobar(15, 19)).to eq 34
    
    end

end
