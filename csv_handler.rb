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
        :name => i[0].split.map{ |part| part.capitalize}.join(' '),
        :postcode => i[1].upcase,
        :opt_out => i[2]
      }
    }
  end
  
  def arr_format
    csv_data.map { |i|
      [
        i[0].split.map{ |part| part.capitalize}.join(' '),
        i[1].upcase,
        i[2]
      ]
    }
  end
end
