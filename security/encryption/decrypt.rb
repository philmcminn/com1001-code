require "openssl"
require 'sqlite3'

puts "Please enter your username:"
username = gets.chomp

puts "Please enter your password:"
password = gets.chomp

db = SQLite3::Database.new './db.sqlite3'
query = 'SELECT iv, salt, key_crypt, confidential1, confidential2, confidential3 
         FROM user
         WHERE username = ?'
result = db.get_first_row(query, username)                               # Read in from the DB
aes = OpenSSL::Cipher.new('AES-128-CBC')                                   # Set up the AES cipher
aes.decrypt                                                                # Set cipher for decryption
aes.iv = result[0]                                                         # Set the initial vector
aes.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(password, result[1], 20000, 16) # Generate key 2
begin
  aes.key = aes.update(result[2]) + aes.final                              # Try to decrypt key 1
rescue OpenSSL::Cipher::CipherError
  puts "decryption error"
else
  aes.reset
  data1 = aes.update(result[3]) + aes.final                                # Decrypt our user data
  puts data1
end
