require "openssl"
require 'sqlite3'

#
# 1) Get the user to enter their information
#
data = {}

puts "Please enter your username:"
data["username"] = gets.chomp

puts "Please enter your password:"
data["password"] = gets.chomp

puts "Please enter your confidential data (1/3)"
data["confidential1"] = gets.chomp

puts "Please enter your confidential data (2/3)"
data["confidential2"] = gets.chomp

puts "Please enter your confidential data (3/3)"
data["confidential3"] = gets.chomp

#
# 2) Encrypt the password and data
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
encrypted_confidential1 = aes.update(data["confidential1"]) + aes.final
encrypted_confidential2 = aes.update(data["confidential2"]) + aes.final
encrypted_confidential3 = aes.update(data["confidential3"]) + aes.final

# Generate key 2 from the password
aes.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(data["password"], salt, 20_000, 16)

# Encrypt key 1 with key 2
key_crypt = aes.update(key) + aes.final

#
# 3) Save the data
#
encrypted = {}

# this is the only part of the record that's not actually encrypted, of course.
encrypted["username"] = data["username"]
encrypted["iv"] = iv
encrypted["salt"] = salt
encrypted["key_crypt"] = key_crypt
encrypted["confidential1"] = encrypted_confidential1
encrypted["confidential2"] = encrypted_confidential2
encrypted["confidential3"] = encrypted_confidential3

db = SQLite3::Database.new './db.sqlite3'

query = 'INSERT INTO user VALUES (?, ?, ?, ?, ?, ?, ?)'
db.execute(query, encrypted["username"], encrypted["iv"], encrypted["salt"], encrypted["key_crypt"], encrypted["confidential1"], encrypted["confidential2"], encrypted["confidential3"])