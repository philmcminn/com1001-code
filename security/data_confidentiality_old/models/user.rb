require "openssl"

# A user record from the database
class User < Sequel::Model
  def initialize(username, password)
    super(username: username, password: encrypt(password))
  end

  def password_match?(password)
    decrypt(self.password) == password
  end

  def encrypt(password)
    cipher = OpenSSL::Cipher.new('aes-128-cbc')
    cipher.encrypt
    key = cipher.random_key
    iv = cipher.random_iv
    cipher.update(password) + cipher.final
  end

  def decrypt(password)
    decipher = OpenSSL::Cipher.new('aes-128-cbc')
    decipher.decrypt
    decipher.key = key
    decipher.iv = iv
    decipher.update(password) + decipher.final
  end
end
