# A user record from the database
class User < Sequel::Model
  def load(params)
    self.username = params.fetch("username", "").strip
    self.password = params.fetch("password", "").strip
  end

  def validate
    super
    errors.add("username", "cannot be empty") if username.empty?
    errors.add("password", "cannot be empty") if password.empty?
  end

  def exist?
    other_user = User.first(username: username)
    !other_user.nil? && other_user.password == password
  end
end
