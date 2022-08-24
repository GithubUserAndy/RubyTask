require 'rspec'
require './csv_handler.rb'

describe CsvHandler do
	subject { CsvHandler.new(file_name) }
  let(:file_name) { 'data.csv' }

  describe '#hash_format' do
    it 'formats the csv correctly' do
      expect(subject.hash_format).to eq(
        [
          {
            :name=>"Derek Trotter",
            :opt_out=>"no",
            :postcode=>"SA1 1NW"
          },
          {
          :name=>"Rick Grimes",
          :opt_out=>"no",
          :postcode=>"SA2 6TR"}
        ]
      )
    end
  end
  describe '#arr_format' do
    it 'formats the csv correctly' do
      expect(subject.arr_format).to eq([
        [
          "Derek Trotter",
          "SA1 1NW",
          "no"
        ],
        [
          "Rick Grimes",
          "SA2 6TR",
          "no"
        ]
      ])
    end
  end
end
