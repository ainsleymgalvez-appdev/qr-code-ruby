require "rqrcode"

# PROMPT INTERACTION WITH USER

puts "Hey! Please select one of the options below to create a QR Code."

user_input = true

while user_input != "4"

puts "1 - Create QR Code for a link"
puts "2 - Create QR Code to create a text"
puts "3 - Create QR Code to connect to Wifi"
puts "4 - Exit this program"

user_input = gets.chomp

  if user_input == "1"

  puts ""
  puts "What website would you like to encode?"

  website_input = gets.chomp

  qrcode=RQRCode::QRCode.new(website_input)
  png = qrcode.as_png({:size => 500})

  puts ""
  puts "What would you like to call the PNG?"
  png_name = gets.chomp

  IO.binwrite(png_name + ".png", png.to_s)

elsif user_input == "2"

  puts ""
  puts "Who would you like to text?"

  send_to = gets.chomp 

  puts ""
  puts "What would you like to say?"

  message = gets.chomp
  qrcode=RQRCode::QRCode.new("SMSTO:+1" + send_to + ":" + message)

  png = qrcode.as_png({:size => 500})

  puts ""
  puts "What would you like to call the PNG?"
  png_name = gets.chomp

  IO.binwrite(png_name + ".png", png.to_s)


elsif user_input == "3"

  puts ""
  puts "What's the name of the Wi-Fi network you are trying to connect to?"

  internet_name = gets.chomp

  puts ""
  puts "What's the password to the Wi-Fi network?"
  internet_pw = gets.chomp

  qrcode=RQRCode::QRCode.new("WIFI:T:WPA;S:" + internet_name + ";P:" + internet_pw + ";;")

  # PROCESS TO CONVERT TO PNG
  png = qrcode.as_png({:size => 500})

  puts ""
  puts "What would you like to call the PNG?"
  png_name = gets.chomp

  IO.binwrite(png_name + ".png", png.to_s)


elsif user_input == "4"
  puts "Thanks for coming by"

else
  puts "Please choose one of the options above"
end

end
# if user_input == "1"

#   puts ""
#   puts "What website would you like to encode?"

#   website_input = gets.chomp

#   qrcode=RQRCode::QRCode.new(website_input)
#   png = qrcode.as_png({:size => 500})

#   puts ""
#   puts "What would you like to call the PNG?"
#   png_name = gets.chomp

#   IO.binwrite(png_name + ".png", png.to_s)

# elsif user_input == "2"

#   puts ""
#   puts "Who would you like to text?"

#   send_to = gets.chomp 

#   puts ""
#   puts "What would you like to say?"

#   message = gets.chomp
#   qrcode=RQRCode::QRCode.new("SMSTO:+1" + send_to + ":" + message)

#   png = qrcode.as_png({:size => 500})

#   puts ""
#   puts "What would you like to call the PNG?"
#   png_name = gets.chomp

#   IO.binwrite(png_name + ".png", png.to_s)


# elsif user_input == "3"

#   puts ""
#   puts "What's the name of the Wi-Fi network you are trying to connect to?"

#   internet_name = gets.chomp

#   puts ""
#   puts "What's the password to the Wi-Fi network?"
#   internet_pw = gets.chomp

#   qrcode=RQRCode::QRCode.new("WIFI:T:WPA;S:" + internet_name + ";P:" + internet_pw + ";;")

#   # PROCESS TO CONVERT TO PNG
#   png = qrcode.as_png({:size => 500})

#   puts ""
#   puts "What would you like to call the PNG?"
#   png_name = gets.chomp

#   IO.binwrite(png_name + ".png", png.to_s)


# else 
#   puts "Please choose one of the options above"
# end

# Use class to encode some text
# qrcode=RQRCode::QRCode.new("https://en.wikipedia.org/wiki/QR_code")

# Used to send text message
# qrcode=RQRCode::QRCode.new("SMSTO:+18478092627:Hey bitch")

# Used to connect to wifi
# # qrcode=RQRCode::QRCode.new("WIFI:T:WPA;S:JI;P:z0ef7mbc7n8ho;;")

# # # Use the method to create 500 x 500 px image
# # png = qrcode.as_png({:size => 500})

# # # Write image data to a file
# IO.binwrite("sometext.png", png.to_s)

#Connecting to Wifi automatically
# WIFI:T:WPA;S:My wifi network;P:supersecretpassword;;
