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
    @csv_data.select { |i| i[2] != 'yes'}[1..-1]
  end

  def hash_format
    csv_data.map { |i|
      row = Hash.new
      {
        :name => capitalize_each_word(i[0]),
        :postcode => i[1].upcase,
        :opt_out => i[2]
      }
    }
  end
  
  def arr_format
    csv_data.map { |i|
      [
        capitalize_each_word(i[0]),
        i[1].upcase,
        i[2]
      ]
    }
  end

  private

  def capitalize_each_word(string)
    string.split.map{ |part| part.capitalize}.join(' ')
  end
end
