use Rack::Deflater

require './app'
map '/' do
  run App
end
