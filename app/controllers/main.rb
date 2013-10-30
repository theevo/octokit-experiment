class MainApplication < Sinatra::Base
  get '/' do
    "greetings, earthling"
  end
end