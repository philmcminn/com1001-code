get "/list" do
  @players = Player.all
  erb :list
end
