require 'sinatra/base'
require 'slim'

class App < Sinatra::Base
  get '/' do
    slim :index
  end
end
