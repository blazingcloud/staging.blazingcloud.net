require './sinatra_modules'

map '/blog' do
  run Blog.new
end
run Sinatra::Application
