# NOTE: escaping values with "h" means we need the line
# include ERB::Util
# in the top-level app.rb file

get "/escaped-value" do
  @submitted_text_field_value = params["text_field"]
  erb :escaped_value
end
