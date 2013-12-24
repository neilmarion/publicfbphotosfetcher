require "open-uri"

File.open("photos", "r").each_line do |line|
  l = line.split('/')[5]
  #f = File.open("cfn/#{l}", "w")

  open(line) {|f|
     File.open("cfn/#{l}","w") do |file|
       file.puts f.read
     end
  }
end


