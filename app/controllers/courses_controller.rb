require 'rack-flash'
class CoursesController < ApplicationController
  use Rack::Flash

  get '/courses/new' do 
    if logged_in?
      erb :'courses/new'
    else
      redirect to '/login'
    end
  end

  post '/new' do
    if logged_in?
      if params[:name] == "" ||
         params[:description] == "" ||
         params[:credits] == "" 
         flash[:message] = "Unable to add course"
         redirect to '/courses/new'
      else
        @course = Course.create(
          name: params[:name],
          instructor: "#{[current_user.first_name, current_user.last_name].join(' ')}",
          description: params[:description],
          credits: params[:credits]
          )
        @relationship = CourseInstructorRelationship.create(
          :course_id => @course.id,
          :user_id => current_user.id
        )
        if @course.save
           flash[:message] = "Course Added"
           redirect to ("/users/#{current_user.slug}")
        else
          flash[:message] = "You are already enrolled in #{@course.name}"
          redirect to '/courses/new'
        end
      end
    else
      redirect to '/login'
    end
  end

  get '/courses/:slug/:id/edit' do
    if logged_in?
      @course = Course.find_by_id(params[:id])

        erb :'courses/edit'
      else
        redirect to '/login'
      end
    
  end

  patch '/courses/:id' do #update post
    if logged_in? 
      @course = Course.find_by_id(params[:id])
      if params[:name] == "" ||
         params[:description] == "" ||
         params[:credits] == "" 
         flash[:message] = "Please fill in all parts!"
         redirect to "/courses/#{current_user.slug}/#{@course.id}/edit"
      else
        @course.update(
          name: params[:name],
          description: params[:description],
          credits: params[:credits]
          )
        @course.save
        redirect to ("/users/#{current_user.slug}")
        end
    else
        redirect to '/login'
    end
  end

  delete '/courses/:slug/:id/delete' do
    if logged_in?
      @course = Course.find_by_id(params[:id])
        if @course && @course.user == current_user
          @course.delete
        end
        redirect to ("/users/#{current_user.slug}")
      else
        redirect to '/login'
      end
    end

end