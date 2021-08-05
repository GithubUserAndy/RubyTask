require 'rspec'
require './csv_handler.rb'

#describing behaviour of CsvHandler
describe CsvHandler do
	subject { CsvHandler.new(file_name) }
  let(:file_name) { 'data.csv' }
=begin
  describe '#loaded?' do
    it 'is true when file is loaded' do
      expect(subject.loaded?).to eq true
    end

    context 'when file is invalid' do
      let(:file_name) {'data_invalid.csv'}

      it 'is false when invalid file is loaded' do
        expect(subject.loaded?).to eq false
      end      
    end
  end
=end
  describe '#format' do
    it 'formats the csv correctly' do
      expect(subject.format).to eq(
        [["Derek Trotter","SA1 1NW", "no"],
        ["Rick Grimes","SA2 6TR","no"]])    
    end
  end


end



