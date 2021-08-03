require 'csv'

class CsvHandler 
  # initialize class
	def initialize(file_name)
		@loaded = false
    
		begin # try to read file
      @csv_data = CSV.read(file_name)
  	rescue Errno::ENOENT # closes program gracefully if error
    	print "File not found"
      exit 1
    end

    @loaded = true
	end

  # getter for loaded
  def loaded?
    @loaded
  end
end
