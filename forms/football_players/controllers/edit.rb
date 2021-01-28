get "/edit" do
  id = params["id"]
  @player = Player[id] if Player.id_exists?(id)
  erb :edit
end

post "/edit" do
  id = params["id"]

  if Player.id_exists?(id)
    @player = Player[id]
    @player.load(params)

    if @player.valid?
      @player.save_changes
      redirect "/search"
    end
  end

  erb :edit
end
