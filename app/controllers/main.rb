class MainApplication < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  get '/' do
    client = Octokit::Client.new \
      :login => MY_LOGIN,
      :password => MY_PASSWORD

    @user = client.user
    erb :'index'
  end
end