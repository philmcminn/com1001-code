require "openssl"

USERNAME = "user"
PASSWORD = "secret"
DATA = "The quick brown fox jumped over the lazy dog"

#
# Encode the password and the data
#
aes = OpenSSL::Cipher.new("AES-128-CBC")                              # Set up the AES cipher
aes.encrypt                                                           # Set cipher for encryption
iv = aes.random_iv                                                    # Generate a random initial vector
key = aes.random_key                                                  # Generate key 1
data_crypt = aes.update(DATA) + aes.final                             # Encrypt our user data with key 1
salt = OpenSSL::Random.random_bytes(16)                               # Generate a random salt
aes.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(PASSWORD, salt, 20000, 16)  # Generate key 2 from the password
aes.reset                                                             # Reset the cipher for new data
key_crypt = aes.update(key) + aes.final                               # Encrypt key 1 with key 2

#
# Decode the password and the data
#
aes = OpenSSL::Cipher.new('AES-128-CBC')                              # Set up the AES cipher
aes.decrypt                                                           # Set cipher for decryption
aes.iv = iv                                                           # Set the initial vector
aes.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(PASSWORD, salt, 20000, 16)  # Generate key 2
begin
  aes.key = aes.update(key_crypt) + aes.final                         # Try to decrypt key 1
rescue OpenSSL::Cipher::CipherError
  puts "Password incorrect"
else
  puts "Password correct."
  aes.reset
  unencrypted_data = aes.update(data_crypt) + aes.final               # Decrypt our user data
  puts "Unencrypted Data: #{unencrypted_data}"
end
