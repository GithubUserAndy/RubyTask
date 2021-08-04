require 'rspec'
require './csv_handler.rb'

#describing behaviour of CsvHandler
describe CsvHandler do
	subject { CsvHandler.new('data.csv') }

  describe '#format' do
    it 'returns array template' do

      expect(subject.format).to eq([["derek trotter","sa1 1nw", "no"],["Rodney trotter","Sa6 W23","yes"],["Rick Grimes","Sa2 6tr","no"]])    
    end
  end

  describe '#capitalise_names' do
    it 'returns data array with names capitalised' do
      expect(subject.capitalise_names).to eq([["Derek Trotter","sa1 1nw", "no"],["Rodney Trotter","Sa6 W23","yes"],["Rick Grimes","Sa2 6tr","no"]])
    end
  end

  describe '#uppercase_postcodes' do
    it 'returns data array with capitalised postcodes and names' do
      expect(subject.uppercase_postcodes).to eq([["Derek Trotter","SA1 1NW", "no"],["Rodney Trotter","SA6 W23","yes"],["Rick Grimes","SA2 6TR","no"]])
    end    
  end

  describe '#remove_if_optout' do
    it 'returns data array with rows with optout set to yes removed and capitalised postcodes and names' do 
      expect(subject.remove_if_optout).to eq([["Derek Trotter","SA1 1NW", "no"],["Rick Grimes","SA2 6TR","no"]])
    end
  end
end



