require 'rspec'
require './csv_handler.rb'

#describing behaviour of CsvHandler
describe CsvHandler do
	subject { CsvHandler.new file_name }
  let(:file_name) { 'data.csv' }

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


end

