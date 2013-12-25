require "open-uri"

counter = 0
File.open("photos", "r").each_line do |line|
  l = line.split('/')[4]
  #f = File.open("cfn/#{l}", "w")

  open(line) {|f|
     File.open("cfn/#{counter}.jpg","wb") do |file|
       puts "downloading #{line}"
       file.puts f.read
       file.close
     end
     counter=counter+1
  }
end


