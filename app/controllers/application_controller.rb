require './config/environment'

class ApplicationController <Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "scheduler_secret"
  end

  get '/' do 
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def is_a_student?
      @current_user == current_user
      @current_user.student?
    end

    def already_enrolled?
      current_user.courses.find_by_slug(@course.slug)
    end

    def missing_inputs?
      params.any?(&:blank?)
    end

    def redirect_to_home
      redirect to "/users/#{current_user.slug}"
    end
  end
end