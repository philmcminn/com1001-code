require "openssl"

# A user record from the database
class User < Sequel::Model
  def password_match?(password)
    puts "Testing #{password} with #{self.password}"
    self.password == password
  end
end
