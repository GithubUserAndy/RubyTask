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

  # formatting csv file in to 2d array (no titles)
  def format
    output = [@csv_data.length()-1]
    for i in 1...@csv_data.length()
      output[i-1] = @csv_data[i]
    end
    output
  end
  

  # 1) capitalise the names 
  def capitalise_names
    output = format
    for i in 0...format.length()
      # assuming here that we know the name will be in the first column- maybe add checker later
      # splitting a name and capitalising the first letter of each part of the name
      split_name = format[i][0].split
      name = ''
      for j in 0...split_name.length()
        if j != split_name.length()-1
          name += split_name[j].capitalize + ' '
        else
          name += split_name[j].capitalize
        end
      end
      output[i][0] = name
    end
    output
  end 

  # 2) set postcodes to uppercase
  def uppercase_postcodes
    output = capitalise_names
    for i in 0...capitalise_names.length()
      output[i][1] = capitalise_names[i][1].upcase
    end
    output
  end

  # 3) remove rows where opt out = yes
  def remove_if_optout
    output = []
    for i in 0...uppercase_postcodes.length()
      if uppercase_postcodes[i][2] != 'yes'
        output.push(uppercase_postcodes[i])
      end
    end
    output
  end
end
