get "/sign-up" do
  erb :sign_up
end

post '/sign-up' do
  @username = params[:username]
  @password = params[:password]

  @username_error = @username.nil? ? "Please enter a username" : nil
  @password_error = @password.nil? ? "Please enter a password" : nil

  if @username_error.nil? && @password_error.nil?
    user = User.first(username: @username)
    if user.nil?
      user = User.new(@username, @password)
      user.save
      redirect "/success"
    else
      @username_error = "Username already exists"
      @error = "Please choose a different username:"
    end
  else
    @error = "Please complete the missing information:"
  end

  erb :sign_up
end

get "/success" do
  erb :success
end
