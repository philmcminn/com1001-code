require "openssl"

#
# 1. Get the user to enter their information
#
puts "Please enter your username:"
username = gets.chomp

puts "Please enter your password:"
password = gets.chomp

puts "Please enter your confidential data (1/3)"
data1 = gets.chomp

puts "Please enter your confidential data (2/3)"
data2 = gets.chomp

puts "Please enter your confidential data (3/3)"
data3 = gets.chomp

#
# 2. Encrypt the password and data
#

# Set up the AES cipher
aes = OpenSSL::Cipher.new("AES-128-CBC")

# Set cipher for encryption
aes.encrypt

# Generate a random initial vector
iv = aes.random_iv

# Generate key 1
key = aes.random_key

# Generate a random salt
salt = OpenSSL::Random.random_bytes(16)

# Encrypt our user data with key 1
data1_encrypted = aes.update(data1) + aes.final
data2_encrypted = aes.update(data2) + aes.final
data3_encrypted = aes.update(data3) + aes.final

# Generate key 2 from the password
aes.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(PASSWORD, salt, 20_000, 16)

# Encrypt key 1 with key 2
key_crypt = aes.update(key) + aes.final

#
# 3. Save the data
#