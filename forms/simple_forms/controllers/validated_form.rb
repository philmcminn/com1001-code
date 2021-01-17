get "/validated-form" do
  @field1 = params["field1"]
  @field2 = params["field2"]

  @form_was_submitted = !@field1.nil?

  @submission_error = false
  @field1_error = false
  @field2_error = false

  if @form_was_submitted
    # validate
    @field1_error = @field1.empty?
    @field2_error = @field2.empty?
    @submission_error = @field1_error || @field2_error
  end

  erb :validated_form
end
