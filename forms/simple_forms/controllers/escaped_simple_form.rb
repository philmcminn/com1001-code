get "/escaped-simple-form" do
  erb :escaped_simple_form
end

get "/process-escaped-simple-form" do
  @submitted_text_field_value = params["text_field"]
  erb :process_escaped_simple_form
end
