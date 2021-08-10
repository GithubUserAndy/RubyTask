require 'rspec'
require './csv_handler.rb'

describe CsvHandler do
	subject { CsvHandler.new(file_name) }
  let(:file_name) { 'data.csv' }

  describe '#format' do
    it 'formats the csv correctly' do
      expect(subject.format).to eq([{
          :name=>"Derek Trotter",
          :opt_out=>"no",
          :postcode=>"SA1 1NW"
        },{
          :name=>"Rick Grimes",
          :opt_out=>"no",
          :postcode=>"SA2 6TR"}])    
    end
  end
end
