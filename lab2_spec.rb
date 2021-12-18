require 'rspec'

require_relative 'lab2.rb'

RSpec.describe "endsWithCS" do

    it "if the word ends with 'sc'" do
        
        expect(endsWithCS("astronautics")).to eq 4096
    
    end
    
    it "if the word not ends with 'cs'" do

        expect(endsWithCS("astronautic")).to eq"cituanortsa"

    end
    
end

RSpec.describe "counterOfPokemon" do

    it 'correct pokemon array output' do
        
        allow_any_instance_of(Kernel).to receive(:gets).and_return(1, "Slowpoke", "Pink")
        
        expect(counterOfPokemon()).to eq([{"name: Slowpoke, color: Pink "=>0}])

    end
    
    it 'correct pokemon array output' do

        allow_any_instance_of(Kernel).to receive(:gets).and_return(2, "Slowpoke", "Pink", "Diglett", "Brown")
        
        expect(counterOfPokemon()).to eq([{"name: Slowpoke, color: Pink "=>0}, {"name: Diglett, color: Brown "=>1}])


    end
    
end

