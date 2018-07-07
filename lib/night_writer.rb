require './lib/braile_dict.rb'
require './lib/encrypt'
require './lib/decrypt'


handle = File.open(ARGV[0], "r")
incoming_txt = handle.read
handle.close
capitalized_text = incoming_txt.upcase
writer = File.open(ARGV[1], "w")
writer.write(capitalized_text)
writer.close
puts "Created #{ARGV[1]}, containing #{capitalized_text.length - 1} characters"
