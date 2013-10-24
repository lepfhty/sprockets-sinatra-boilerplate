require 'eco'
require 'sprockets'

use Rack::Deflater

map '/assets' do
  env = Sprockets::Environment.new
  env.append_path 'javascripts'
  env.append_path 'stylesheets'
  env.append_path 'images'
  env.append_path 'bower_components'
  run env
end

require './app'
map '/' do
  run App
end
