require 'spec_helper'

describe 'USERS_CONTROLLER' do

  describe 'Available Routes' do
    it 'has /signup' do
      get '/signup'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Signup")
    end

    it 'has /login' do
      get '/login'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Login")
    end
  

  end

end