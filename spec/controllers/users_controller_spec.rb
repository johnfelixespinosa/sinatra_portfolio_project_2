require 'spec_helper'

describe 'USERS_CONTROLLER' do
  @user = User.create(:username => "studenttest", 
    :first_name => "John",
    :last_name => "Espinosa",
    :email => "johnespinosa@gmail.com",
    :password => "password")
  end

  describe 'Available Routes' do
    before do
    @user = User.create(:username => "studenttest", 
      :first_name => "John",
      :last_name => "Espinosa",
      :email => "johnespinosa@gmail.com",
      :password => "password")
    end

    it 'has get /signup' do
      get '/signup'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Signup")
    end

    it 'has /login' do
      get '/login'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Login")
    end

    it 'has /users/:slug' do
      visit "/users/#{@user.slug}"
      expect(page.current_path).to eq('/users/studenttest')
    end
end

