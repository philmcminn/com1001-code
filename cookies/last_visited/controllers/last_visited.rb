LAST_VISITED_COOKIE = "last_visited"
NUM_VISITS_COOKIE = "num_visits"

get "/" do
  last_visited_cookie_value = request.cookies[LAST_VISITED_COOKIE]
  num_visits_cookie_value = request.cookies.fetch(NUM_VISITS_COOKIE, 0).to_i

  response.set_cookie(LAST_VISITED_COOKIE, Time.now)
  response.set_cookie(NUM_VISITS_COOKIE, num_visits_cookie_value + 1)

  # convert the cookie values into friendlier formatted strings
  # that can be displayed in the view
  @last_visited = ""
  @num_visits = num_visits_cookie_value
  if @num_visits.positive?
    # parse in the date/time string in the cookie
    last_visited_time = Time.parse(last_visited_cookie_value)

    # format the date/time
    @last_visited = last_visited_time.strftime("%a %b %d, %I:%M:%S %p")
  end

  erb :index
end

get "/delete" do
  response.delete_cookie(LAST_VISITED_COOKIE)
  response.delete_cookie(NUM_VISITS_COOKIE)

  erb :delete
end
