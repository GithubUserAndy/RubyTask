require 'csv'

class CsvHandler 
	def initialize(file_name)
		begin 
      @csv_data = CSV.read(file_name)
  	rescue Errno::ENOENT 
    	print "File not found"
      exit 1
    end
	end

  def csv_data
    @csv_data[1..-1]
  end

  def hash_format
    csv_data.map do |row|
      next if row[2] == 'yes'

      {
        name: capitalize_each_word(row[0]),
        postcode: row[1].upcase,
        opt_out: row[2]
      }
    end.compact
  end

  def arr_format
    csv_data.map do |row|
      next if row[2] == 'yes'

      [
        capitalize_each_word(row[0]),
        row[1].upcase,
        row[2]
      ]
    end.compact
  end

  private

  def capitalize_each_word(string)
    string.split.map{ |part| part.capitalize}.join(' ')
  end
end
