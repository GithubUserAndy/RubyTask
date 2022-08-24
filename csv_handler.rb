require 'csv'

class CsvHandler 
	def initialize(file_name)
		begin
      @csv_data = CSV.read(file_name, headers: true)
  	rescue Errno::ENOENT
    	print "File not found"
      exit 1
    end
	end

  def csv_data
    @csv_data
  end

  def hash_format
    base_data
  end

  def base_data
    csv_data.map do |row|
      next if row["Opt out"] == 'yes'

      [
        [:name, capitalize_each_word(row["Name"])],
        [:postcode, row["Postcode"].upcase],
        [:opt_out, row["Opt out"]]
      ]
    end.compact.map(&:to_h)
  end

  def arr_format
    base_data.map(&:values)
  end

  private

  def capitalize_each_word(string)
    string.split.map{ |part| part.capitalize}.join(' ')
  end
end
