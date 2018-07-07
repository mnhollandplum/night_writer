# class NightWriter
#
#   def intialize
#
#   end
#
#   def read_contents
#     open_file = File.open 'message.txt'
#     read_file = open_file.read
#   end
#
#   def total_characters_in_file
#     read_contents.length
#   end
#
#
#
# end

handle = File.open(ARGV[0], "r")

incoming_txt = handle.read
handle.close
capitalized_text = incoming_txt.upcase
writer = File.open(ARGV[1], "w")
writer.write(capitalized_text)
writer.close
puts "Created #{ARGV[1]}, containing #{capitalized_text.length - 1} characters"
