require 'csv'

class CsvHandler 
  # initialize class

  @loaded = false
	def initialize(file_name)
		begin # try to read file
      @csv_data = CSV.read(file_name)
  	rescue Errno::ENOENT # closes program gracefully if error
    	print "File not found"
      exit 1
    end
    @loaded = true
	end

  def loaded?
    @loaded
  end

  def format
  # 1) format the csv file in to 2d array (no titles)
    output = []
    @csv_data.each do |i|
      row = Hash.new
      puts i[0]
      row["name"] = i[0]
      row["postcode"] = i[1]
      row["opt out"] = i[2]
      output.push(row)
    end
    output.shift
  
  # 2) remove rows with opt out set to yes
    output.each do |i|
    if i["opt out"] == 'yes'
      output.delete(i)
    end

  # 3) capitalise the names  
    output.each do |i|
      i["name"] = i["name"].split.map{ |part| part.capitalize}.join(' ')
    end

  # 4) set postcodes to uppercase
    output.each do |i|
      i["potcode"] = i["postcode"].upcase
    end



    end

    output
  end

end
