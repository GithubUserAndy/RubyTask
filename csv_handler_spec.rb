require 'rspec'
require './csv_handler.rb'

#describing behaviour of CsvHandler
describe CsvHandler do
	subject { CsvHandler.new(file_name) }
  let(:file_name) { 'data.csv' }

  describe '#format' do
    it 'returns contents of csv file in 2d array format' do
      expect(subject.format).to eq([["Derek Trotter","SA1 1NW", "no"],["Rick Grimes","SA2 6TR","no"]])    
    end
  end


end



