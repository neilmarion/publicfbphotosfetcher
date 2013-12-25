require "open-uri"

File.open("photos", "r").each_line do |line|
  l = line.split('/')[4]
  #f = File.open("cfn/#{l}", "w")

  open(line) {|f|
     File.open("cfn/#{l}","w+") do |file|
       puts "downloading #{line}"
       file.puts f.read
       file.close
     end
  }
end


