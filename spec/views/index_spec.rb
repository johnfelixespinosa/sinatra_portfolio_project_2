require 'spec_helper'

describe 'SIGNUP PAGE' do

  describe 'Signup Page' do
    it 'loads the signup page' do
      get '/signup'
      expect(last_response.status).to eq(200)
    end
  
    it 'has a form' do
      visit "/signup"
      expect(page).to have_css 'form'
    end
  end

end