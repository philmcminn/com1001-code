get "/post-form" do
  erb :post_form
end

post "/post-form" do
  @form_was_submitted = true

  # load
  @field1 = params.fetch("field1", "")
  @field2 = params.fetch("field2", "")

  # sanitize
  @field1.strip!
  @field2.strip!

  # validate
  @field1_error = @field1.empty?
  @field2_error = @field2.empty?
  @submission_error = @field1_error || @field2_error

  erb :post_form
end
