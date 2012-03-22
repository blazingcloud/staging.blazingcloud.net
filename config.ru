require './sinatra_modules'
map '/short-read' do
  run BlogRewriter.new
end

map '/blog' do
   run   lambda { |env|
      [301, {'Content-Type'=>'text/plain','Location' => 'http://blog.blazingcloud.net'}, ['moved']] 
    }
end

map '/' do
  run Assets.new
end

map '/' do
  run Redirect.new
end

map '/' do
  run Site.new
end



