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

# the above '/' works for Assets
# when i declare another '/'
# map '/' do
#  run Redirect.new
# end
# it doesn't remember this '/'
map '/' do
  run Site.new
end


