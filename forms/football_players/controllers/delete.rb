post "/delete" do
  id = params["id"]

  if Player.id_exists?(id)
    player = Player[id]
    player.delete
    redirect "/search"
  end

  erb :delete
end
