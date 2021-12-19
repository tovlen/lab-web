require 'rspec'
require_relative 'lab4_2.rb'

describe 'ATM' do

    it 'Show your balance: ' do

        allow_any_instance_of(Kernel).to receive(:gets).and_return("B", "Q")
        expect(CashMachine.main)
        expect(File.read("balance.txt")).to eql("100.0")

    end

    it 'Deposit cash: ' do
        
        allow_any_instance_of(Kernel).to receive(:gets).and_return("D", "400", "Q")
        expect(CashMachine.main)
        expect(File.read("balance.txt")).to eql("500.0")

    end

    it 'Withdraw cash: ' do
        
        allow_any_instance_of(Kernel).to receive(:gets).and_return("W", "200", "Q")
        expect(CashMachine.main)
        expect(File.read("balance.txt")).to eql("300.0")

    end

end
