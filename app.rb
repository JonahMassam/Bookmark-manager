require "sinatra"
require "capybara"
require "capybara/rspec"
require "rspec"
require 'sinatra/reloader' if development?
require "pg"


class BookmarkManager < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    redirect "bookmarks"
  end

  get "/bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager', user: 'JMMakers', password: '1234')
    result = connection.exec('SELECT url FROM bookmarks')
    @bookmarks = result.map { |bookmark| bookmark["url"] }
    erb :bookmarks
  end

  get "/new_bookmark" do
    erb :new_bookmark
  end

  post "/submit_new_bookmark" do
    @new_bookmark = params[:bookmark_url]
    connection = PG.connect(dbname: 'bookmark_manager', user: 'JMMakers', password: '1234')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{@new_bookmark}')")
    redirect "/bookmarks"
  end
    

  
  run! if app_file == $0
end