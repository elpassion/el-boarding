Trestle.configure do |config|
  config.site_title = "El Boarding"
  config.reload = :always
  config.auth.user_class = -> { Administrator }
  config.auth.user_admin = -> { :"auth/administrators" }
end
