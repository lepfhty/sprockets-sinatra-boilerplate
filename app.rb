require 'sinatra/base'
require 'sinatra/asset_pipeline'
require 'slim'

require 'coffee-script'
require 'eco'

class App < Sinatra::Base
  # in production, compress assets
  set :assets_css_compressor, :yui
  set :assets_js_compressor, :uglifier

  # in development, serve individual files
  configure :test, :development do
    Sprockets::Helpers.configure do |config|
      config.debug = true
    end
  end

  # integrate Sprockets
  register Sinatra::AssetPipeline

  # your app here
  get '/' do
    slim :index
  end
end
