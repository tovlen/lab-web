require 'rspec'
require_relative 'lab3_3.rb'

describe "ATM transactions" do
    
    it 'The ATM screen displays a default balance of 100.0' do
        
        allow_any_instance_of(Kernel).to receive(:gets).and_return("B", "Q")
        expect(File.read("balance.txt")).to eql("100.0")

    end

    it 'The ATM screen displays your current deposit 300 and adds up with the balance 100.0' do

        allow_any_instance_of(Kernel).to receive(:gets).and_return("D", "300", "Q")
        expect(File.read("balance.txt")).to eql("400.0")

    end

    it 'The screen displays the amount withdrawn 300 and is deducted from your balance 400.0' do

        allow_any_instance_of(Kernel).to receive(:gets).and_return("W", "300", "Q")
        expect(File.read("balance.txt")).to eql("100.0")

    end

end

