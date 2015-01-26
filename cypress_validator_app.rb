require 'sinatra'

class CypressValidatorApp < Sinatra::Base
  get "/" do
    erb :index
  end


  get "/validate" do

  end
end
