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

  # 1) format the csv file in to 2d array (no titles)
  def format
    output = []
    @csv_data.drop(1).each do |i|
      output.push(i)
    end

  
  # 2) capitalise the names
    
    output.each do |i|
      name = ''
      split_name = i[0].split()
      split_name.each do |j|
        name += ' ' + j.capitalize
      end
      i[0] = name[1..-1] 
    end



  # 3) set postcodes to uppercase

    output.each do |i|
      i[1] = i[1].upcase
    end



  # 4) remove rows where opt out = yes

    output.each do |i|
      if i[2] == 'yes'
        output.delete(i)
      end
    end

    output
  end

end
