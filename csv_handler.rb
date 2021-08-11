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
    csv_data.map do |i|
      next if i[2] == 'yes'

      row = Hash.new
      {
        :name => capitalize_each_word(i[0]),
        :postcode => i[1].upcase,
        :opt_out => i[2]
      }
    end.compact
  end
  
  def arr_format
    csv_data.map do |i|
      next if i[2] == 'yes'

      [
        capitalize_each_word(i[0]),
        i[1].upcase,
        i[2]
      ]
    end.compact
  end

  private

  def capitalize_each_word(string)
    string.split.map{ |part| part.capitalize}.join(' ')
  end
end
