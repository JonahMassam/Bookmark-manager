require "sinatra"
require "capybara"
require "capybara/rspec"
require "rspec"
require 'sinatra/reloader' if development?


class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    "Hello"
  end

  
  run! if app_file == $0
end