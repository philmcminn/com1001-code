get "/" do
  redirect "/login" unless session[:logged_in]
  erb :index
end

get "/login" do
  erb :login
end

post '/login' do
  # load
  username = params.fetch("username", "")
  password = params.fetch("password", "")

  # sanitize
  username.strip!
  password.strip!

  # validate
  @username_error = username.empty? ? "Please enter a username" : nil
  @password_error = password.empty? ? "Please enter a password" : nil
  @submission_error = nil

  if @username_error.nil? && @password_error.nil?
    user = User.first(username: username)
    if !user.nil? && user.password_match?(password)
      session[:logged_in] = true
      redirect "/"
    else
      @submission_error = "Username/Password combination incorrect"
    end
  else
    @submission_error = "Please complete the missing information:"
  end

  erb :login
end

get "/logout" do
  session.clear
  erb :logout
end
