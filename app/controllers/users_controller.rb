require 'sinatra'
require 'sinatra/flash'
class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

end