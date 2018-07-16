require 'spec_helper'

describe 'APPLICATION_CONTROLLER' do

  describe "Homepage" do
    it 'loads the homepage' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Enroll Today!")
    end
  end

end