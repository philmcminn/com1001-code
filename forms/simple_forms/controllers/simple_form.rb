get "/simple-form" do
  @submitted_text_field_value = params["text_field"]
  erb :simple_form
end
