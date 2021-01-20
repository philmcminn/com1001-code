require_relative "common/setup_db"
require "openssl"

#
# 1) Get the user to enter their username and password
#
puts "Please enter your username:"
username = gets.chomp

puts "Please enter your password:"
password = gets.chomp

#
# 2) Get the user's record from the database
#
users = DB[:users] 
user = users.where(:username => username).first

if user.nil?
  abort "Unknown username '#{username}'."
end

#
# 3) Do the decryption
#

# Set up the AES cipher and set it to decrypt mode
aes = OpenSSL::Cipher.new('AES-128-CBC')                                   
aes.decrypt                                                                

# Get the initial vector
aes.iv = user[:iv]                                                         

# Derive a 16-byte key from the user's password. If the user's password is
# correct, this will produce the correct key to decrypt the initial key.
aes.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(password, user[:salt], 20000, 16) 

# Attempt to decrypt the key 
begin
  aes.reset
  aes.key = aes.update(user[:encrypted_key]) + aes.final                              
rescue OpenSSL::Cipher::CipherError
  puts "Incorrect password."
else
  # Decrypt our user data
  aes.reset
  address = aes.update(user[:encrypted_address]) + aes.final                                
  aes.reset
  telephone_number = aes.update(user[:encrypted_telephone_number]) + aes.final                                
  puts "===================================="
  puts "The user name and password is OK."
  puts "The unencrypted data is as follows:"
  puts "Address: #{address}"
  puts "Telephone number: #{telephone_number}"
end
