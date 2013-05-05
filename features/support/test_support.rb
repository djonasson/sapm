# Requires test support files shared between cucumber and rspec
Dir[Rails.root.join("test_support/**/*.rb")].each { |f| require f }
