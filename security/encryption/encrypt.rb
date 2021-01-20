require_relative "common/setup_db"
require "openssl"

#
# 1) Get the user to enter their information
#
users = DB[:users] 
data = {}

puts "Please enter your username:"
username = gets.chomp

unless users.where(:username => username).count.zero?
  abort "Sorry, the username '#{username}' already exists - try another one."
end

puts "Please enter your password:"
password = gets.chomp

puts "Please enter your address"
address = gets.chomp

puts "Please enter your telephone number"
telephone_number = gets.chomp

#
# 2) Encrypt the password and data
#

# Set up the AES cipher and set it to encrypt mode
aes = OpenSSL::Cipher.new("AES-128-CBC")
aes.encrypt

# Generate a random initial vector and key
iv = aes.random_iv
key = aes.random_key

# Encrypt the user's address
encrypted_address = aes.update(address) + aes.final

# Reset (we must to do this before every following call to "aes.update(...)"
# and encrypt the user's telephone number
aes.reset
encrypted_telephone_number = aes.update(telephone_number) + aes.final

# Generate a random salt
salt = OpenSSL::Random.random_bytes(16)

# Derive a 16-byte key from the user's password
aes.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(password, salt, 20_000, 16)

# Reset and use that key to encrypt the previous key that encrypted the user's data
aes.reset
encrypted_key = aes.update(key) + aes.final

#
# 3) Save username, encryption data, and encrypted user data
#
users.insert(username, iv, salt, encrypted_key, encrypted_address, encrypted_telephone_number)
