require 'csv'

class CsvHandler 
  @loaded = false
	def initialize(file_name)
		begin 
      @csv_data = CSV.read(file_name)
  	rescue Errno::ENOENT 
    	print "File not found"
      exit 1
    end
    @loaded = true
	end


  def hash_format
    @csv_data.each do |i|
      if i[2] == 'yes'
        @csv_data.delete(i)
      end
    end
    @csv_data.map { |i|
      row = Hash.new
      {
        :name => i[0].split.map{ |part| part.capitalize}.join(' '),
        :postcode => i[1].upcase,
        :opt_out => i[2]
      }
    }[1..-1]
  end
  
  def arr_format
    @csv_data.each do |i|
      if i[2] == 'yes'
        @csv_data.delete(i)
      end
    end
    @csv_data.map { |i|
      [
        i[0].split.map{ |part| part.capitalize}.join(' '),
        i[1].upcase,
        i[2]
      ]
    }[1..-1]
  end
end
