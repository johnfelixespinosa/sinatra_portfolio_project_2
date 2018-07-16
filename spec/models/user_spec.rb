require 'spec_helper'

describe "User" do
  before do 
    @user = User.create(:username => "studenttest", 
      :first_name => "John",
      :last_name => "Espinosa",
      :email => "johnespinosa@gmail.com",
      :password_digest => "password")
    end
    
    it "has a username" do
      expect @user.username = "studenttest"
    end

    it "can slugify its name" do
      expect(@user.slug).to eq("studenttest")
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