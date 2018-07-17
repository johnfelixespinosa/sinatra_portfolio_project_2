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

    describe 'User Signup' do
      before do
        visit "/signup"
        click_button 'Submit'
      end
        it 'should redirect if fields are empty' do
        expect(current_path).to eq '/signup' 
        end
    end
  end
  
end

