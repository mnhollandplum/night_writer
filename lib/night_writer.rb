require './lib/encrypt.rb'

e = Encrypt.new

handle = File.open(ARGV[0], "r")

incoming_txt = handle.read
handle.close
braile_text = e.translate(incoming_txt).flatten
writer = File.open(ARGV[1], "w")
writer.write(braile_text)
writer.close
puts "Created #{ARGV[1]}, containing #{braile_text.length - 1} characters"
