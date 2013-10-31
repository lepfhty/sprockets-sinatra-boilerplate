require 'sinatra/base'
require 'sinatra/asset_pipeline'
require 'slim'

require 'coffee-script'
require 'eco'

class App < Sinatra::Base
  set :assets_css_compressor, :yui
  set :assets_js_compressor, :uglifier

  configure :test, :development do
    Sprockets::Helpers.configure do |config|
      config.debug = true
    end
  end

  register Sinatra::AssetPipeline

  get '/' do
    slim :index
  end
end
