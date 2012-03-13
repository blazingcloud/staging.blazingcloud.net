require './sinatra_modules'
map '/blog' do
  run Blog.new
end

map '/assets' do
  run Assets.new
end
