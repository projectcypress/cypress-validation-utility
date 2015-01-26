require "sinatra/base"
require "sinatra/reloader"


class CypressValidatorApp < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    erb :index, layout: :layout
  end

  post "/validate" do
    erb :results, layout: :layout
  end
end
