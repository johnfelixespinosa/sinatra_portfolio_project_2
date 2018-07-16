require 'spec_helper'

describe "USER MODEL" do
  before do 
    @user = User.create(:username => "studenttest", 
      :first_name => "John",
      :last_name => "Espinosa",
      :email => "johnespinosa@gmail.com",
      :password => "password")
    end
    
    it "has a username, first name, last name, and email" do
      expect @user.username = "studenttest"
      expect @user.first_name = "John"
      expect @user.last_name = "Espinosa"
      expect @user.email = "johnespinosa@gmail.com"
    end

    it "can slugify its name" do
      expect(@user.slug).to eq("studenttest")
    end

    it 'can find a user based on the slug' do
      slug = @user.slug
      expect(User.find_by_slug(slug).username).to eq("studenttest")
    end
  
    it 'has a secure password' do
      expect(@user.authenticate("password")).to be_truthy
    end


  #   blank_space =  Song.create(:name => "Blank Space", :artist => @artist) 

  #   pop = Genre.create(:name => "Pop")

  #   blank_space.genre_ids = pop.id
    
  # end
  # it "can be initialized" do
  #   expect(@artist).to be_an_instance_of(Artist)
  # end

  # it "can have a name" do
  #   expect(@artist.name).to eq("Taylor Swift")
  # end

  # it "has many songs" do
  #   expect(@artist.songs.count).to eq(1)
  # end

  # it "can have many genres" do
  #   expect(@artist.genres.count).to eq(1)
  # end

  # it "can slugify its name" do

  #   expect(@artist.slug).to eq("taylor-swift")
  # end

  # describe "Class methods" do
  #   it "given the slug can find an Artist" do
  #     slug = "taylor-swift"
  #     expect((Artist.find_by_slug(slug)).name).to eq("Taylor Swift")
  #   end
  # end

end