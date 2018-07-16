require 'sinatra'
require 'sinatra/flash'
class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  get '/login' do
    erb :'/users/login'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end  

  post '/signup' do
    if params.has_value?("")
       redirect to '/signup'
    # elsif
    #    username_exists?(params[:username])
    #    flash[:message] = "Username exists, try logging in."
    #    redirect to '/login'
    elsif
       params[:username].length < 8
       flash[:message] = "Username to short"
       redirect to '/signup'
    # elsif
    #    email_exists?(params[:email])
    #    flash[:message] = "Email already in use, please try again."
    #    redirect to '/signup'
    elsif
       params[:password].size < 8
       flash[:message] = "Password to short"
       redirect to '/signup'
    # elsif
    #    params[:usertype] == "instructor" && !email_has_iocc_staff_edu?(params[:email])
    #    flash[:message] = "IOCC instructors please use your @iocc.staff.edu email"
    #    redirect to '/signup'
    else
       @user = User.new(
        :username => params[:username],
        :first_name => params[:first_name],
        :last_name => params[:last_name],
        :email => params[:email],
        :password => params[:password],
        )
       @user.save
       session[:user_id] = @user.id
       
       redirect to ("/users/#{current_user.slug}")
     end
  end

end