require './sinatra_modules'
map '/blog' do
  run Blog.new
end

map '/' do
  run Assets.new
end

map '/' do
  run Site.new
end

