require './lib/decrypt.rb'
require 'pry'

d = Decrypt.new

handle = File.open(ARGV[0], "r")

incoming_txt = handle.read.chomp
handle.close
english_text = d.translate(incoming_txt)
writer = File.open(ARGV[1], "w")
writer.write(english_text)
writer.close
puts "Created #{ARGV[1]}, containing #{english_text.length - 1} characters"
