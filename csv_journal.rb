def read_from_csv(target,type)
  require 'csv'

  if type == "date,time,entry"
    CSV.foreach(target) do |row|
      puts "#{row[2]}-#{row[1]} #{row[3]}:#{row[4]}:#{row[5]}; #{row[6]}"
    end
  elsif type == "time,entry"
    CSV.foreach(target) do |row|
      puts "#{row[3]}:#{row[4]}:#{row[5]}; #{row[6]}"
    end
  elsif type == "entry"
    CSV.foreach(target) do |row|
      puts row[6]
    end
  else
    puts "invalid entry type..."
  end

end
def find_in_csv(target,search_by)
  require 'csv'
  puts "NOTES:"
  CSV.foreach(target) do |row|
    if row[7] == search_by
      # puts row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[7]
      puts row[6]
    end
  end
end
def commit_to_file(target)

  require 'csv'
  @entry = "blank"

  while @entry != "quit"
    print "           "
    puts "*"*53
    print "          >"

    @entry = gets.chomp.to_s

    keyword = ["test","workout"]

    if @entry == 'quit'
      puts "quitting..."


    elsif @entry == keyword[0]
      puts "adding #{keyword[0]} tag"
      @type = keyword[0]

    elsif @entry == "workout"
      puts "adding workout tag"
      @type = "workout"

    elsif @entry != 'quit' && @entry != keyword[0] && @entry != keyword[1]

      @type = "notes"
      today = Time.now
      @year = today.year
      @month = today.mon
      @day = today.day
      @date = "#{@month}-#{@day}"
      @hour = "%02d" % today.hour
      @minute = "%02d" % today.min
      @second = "%02d" % today.sec
      @time = "#{@hour}:#{@minute}:#{@second}"

      CSV.open(target, "a+") do |csv|
        csv << [@year,@month,@day,@hour,@minute,@second," #{@entry}",@type]
      end
      read_from_csv(target, "time,entry")
    end
  end
  puts "exitting"
end
def create_file(target, function = null, new_text)
  File.open(target, function) do |file| file.write("#{new_text}\n")
  end
end
def read_from_file(name)
  read_from_csv(name, "date,time,entry")
end
def create_new_csv_record(name)
  today = Time.now

  @month = today.mon
  @day = today.day
  @date = "#{@month}-#{@day}"

  @hour = "%02d" % today.hour
  @minute = "%02d" % today.min
  @second = "%02d" % today.sec
  @time = "#{@hour}:#{@minute}:#{@second}"

  create_file(name, 'w', "2018,#{@month},#{@day},#{@hour},#{@minute},#{@second}, #{name} created")
  commit_to_file(name)
end
def open_existing_csv_record(name)
  puts " "
  read_from_csv(name, "date,time,entry")
  puts " "
  commit_to_file(name)
end
def return_all(prefix= "", type)
  basedir = "."
  files = Dir.glob("#{prefix}*.#{type}")
  sorted = files.sort!
  r = sorted.reverse!
  @all = r.length
  # puts " "
  # puts "#{@all} files with .#{type} extension"
  return r[0..@all]
end
def create_new
  time = Time.now
  day = time.day
  month = time.mon
  hour = time.hour
  minute = time.min
  second = time.sec


  @todays_date = "#{month}-#{day}"
  @current_time = "#{hour}:#{minute}:#{second}"
  @existing_files = return_all("csv")
  @file_name = "#{@todays_date}.csv"

  print "found #{@file_name}? = "
  puts @existing_files.include?(@file_name)

  if @existing_files.include?(@file_name)
    open_existing_csv_record(@file_name)
  else
    puts "creating new..."
    create_new_csv_record(@file_name)
  end

  puts "goodbye"
end

create_new
#find_in_csv("7-8.csv","notes")
