require 'sinatra'
require 'sinatra/flash'
class UsersController < ApplicationController
  register Sinatra::Flash

  get '/signup' do
    erb :'/users/signup'
  end

  get '/login' do
    erb :'/users/login'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/home'
  end  

  post '/signup' do
    @user = User.new(
        :username => params[:username],
        :first_name => params[:first_name],
        :last_name => params[:last_name],
        :email => params[:email],
        :password => params[:password],
        :usertype => params[:usertype]
        )
       @user.save
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Signup Successful"
      redirect to ("/users/#{current_user.slug}")
    else
      flash[:message] = @user.errors.full_messages
      redirect to '/signup'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Successfully Logged In"
      redirect to ("/users/#{current_user.slug}")
    else
      flash[:message] = "Account Not Found, Please Signup"
      redirect to '/signup'
    end
  end

      
  
       

end