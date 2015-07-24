require 'sinatra'
require 'sinatra/activerecord'
require './model'

set :database, "sqlite3:trump.db" 

$html_title = "Trumptastic"

$nav = {
  "/" => {
    erb: :index,
    nav: "Home",
    title: "Welcome"
  },
  "/hall" => {
    erb: :hall,
    nav: "Hall",
    title: "Hall of Losers"
  },
  "/jobs" => {
    erb: :jobs,
    nav: "Jobs",
    title: "Job Creator"
  },
  "/quotes" => {
    erb: :quotes,
    nav: "Quotes",
    title: "Classy Quotes"
  },
  "/team" => {
    erb: :team,
    nav: "Team",
    title: "Our Team"
  }
}

$nav.each do | route, hash |
  get route do 
    erb :layout, :layout => false do
      erb hash[:erb]
    end
  end
end

# get "/" do 
#   erb :layout, :layout => false do
#     erb :index
#   end
# end

# get "/hall" do
#   erb :layout, :layout => false do
#     erb :hall
#   end
# end

# get "/jobs" do
#   erb :layout, :layout => false do
#     erb :jobs
#   end
# end

# get "/quotes" do
#   erb :layout, :layout => false do
#     erb :quotes
#   end
# end

# get "/team" do
#   erb :layout, :layout => false do
#     erb :team
#   end
# end
