#!/usr/bin/env ruby
<<<<<<< HEAD
puts ARGV[0].scan(/\[from:(.*?)\] \[to:(.*?)\] \[flags:(.*?)\] /).join(',')
=======
puts ARGV[0].scan(/(?<=from:|to:|flags:).*?(?=\])/).join(",")
>>>>>>> d0a145723f833952ca932de755025bc709e7963d
