require 'rack-flash'
class CoursesController < ApplicationController
  use Rack::Flash

  ##########INSTRUCTOR USER ROUTES##########

  get '/courses/new' do 
    if !unauthorized?
      erb :'courses/new'
    else
      redirect to '/login'
    end
  end

  post '/new' do
    redirect_to_login if unauthorized?
    redirect_to_new if missing_inputs?

    @course = Course.create(
      name:        params[:name],
      instructor:  current_user.full_name,
      description: params[:description],
      credits:     params[:credits] 
    )
    @relationship = CourseInstructorRelationship.create(
      course_id: @course.id,
      user_id:   current_user.id
    )

    if @course.save
      flash[:message] = "Course Added"
      redirect_to_home
    else
      flash[:message] = "Unable to add course"
      redirect to "/courses/new"
    end
  end

  get '/courses/:slug/:slug/edit' do
    redirect_to_login if unauthorized?
      
    @course = Course.find_by_slug(params[:slug])
    erb :'courses/edit'
  end

  patch '/courses/:slug' do #update post
    redirect_to_login if unauthorized?
    redirect_to_edit if missing_inputs?

    @course = Course.find_by_slug(params[:slug])
    @course.update(
      name:        params[:name],
      description: params[:description],
      credits:     params[:credits]
    )
    if @course.save
       flash[:message] = "Course Edited"
       redirect_to_home
    else
       flash[:message] = "Unable to edit course"
       redirect_to_edit
    end
  end

  delete '/courses/:slug/:slug/delete' do
    redirect_to_login if unauthorized?
    
    @course = Course.find_by_slug(params[:slug])
    if @course && @course.user == current_user
      @course.delete
      redirect_to_home
    else
      redirect to '/login'
    end
  end

  ##########STUDENT USER ROUTES##########

  get '/courses/search' do
    @user = User.find_by_slug(params[:slug])
    erb :'courses/search'
  end


  get '/courses/:slug/info' do
    redirect_to_login if unauthorized?
    find_current_course if is_a_student?

    @course = Course.find_by_slug(params[:slug])
      @description = @course.description
      @instructor = @course.instructor
      @name = @course.name
      @credits = @course.credits
    erb :'courses/info'
  end

  get '/courses/:slug/enroll' do 
    redirect_to_login if unauthorized?
    find_current_course if is_a_student?

    @enroll = CourseStudentEnrollment.create(
      user_id:   session[:user_id],
      course_id: @course.id
    )
      @enroll.save
      #flash[:message] = "Enrolled in Course"
      redirect_to_home
      end
    end
  end

    private

    def redirect_to_login
      redirect to '/login'
    end

    def redirect_to_home
      redirect to "/users/#{current_user.slug}"
    end

    def redirect_to_new
      redirect to '/courses/new'
    end

    def redirect_to_edit
      redirect to "/courses/#{current_user.slug}/#{@course.slug}/edit"
    end

    def unauthorized?
      !logged_in?
    end

    def find_current_course
      @course = Course.find_by_slug(params[:slug])
    end

    def missing_inputs?
      params.any?(&:blank?)
    end

end