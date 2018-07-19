require 'pry'
require 'sinatra'
require 'sinatra/flash'
require 'sinatra/content_for'
class UsersController < ApplicationController
  register Sinatra::Flash
  helpers Sinatra::ContentFor


  get '/signup' do
    erb :'/users/signup'
  end

  get '/login' do
    erb :'/users/login'
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

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/home', :layout => :layout do
      erb :dashboard
    end
  end  

  post '/signup' do
    @user = User.create(
        :username => params[:username],
        :first_name => params[:first_name],
        :last_name => params[:last_name],
        :email => params[:email],
        :password => params[:password],
        :usertype => params[:usertype]
        )
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Signup Successful"
      redirect to ("/users/#{current_user.slug}")
      # params.inspect 
    else
      flash[:message] = @user.errors.full_messages
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/'
    end
  end

      
  
       

end