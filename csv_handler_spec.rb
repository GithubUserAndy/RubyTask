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
      expect(subject.format).to eq([
        {"name"=>"Derek Trotter", "opt out"=>"no", "postcode"=>"sa1 1nw", "potcode"=>"SA1 1NW"},
        {"name"=>"Rick Grimes", "opt out"=>"no", "postcode"=>"Sa2 6tr", "potcode"=>"SA2 6TR"}])    
    end
  end


end



