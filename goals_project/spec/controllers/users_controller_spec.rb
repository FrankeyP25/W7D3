require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  subject(:user) do
    User.create!(
      username: "test500",
      password: "password888"
    )
  end

  describe "GET #index" do
    it "renders the index page" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "renders the index page" do
      get :show, params: {id: user.id}
      expect(response).to render_template(:show)
    end
  end

  describe "POST #create" do
    before :each do
      post :create, params: {user:{username: "test500", password: "password555"}}
    end
    it "validates uniqueness of username" do
      #user[username],user{password}
      post :create, params: {user:{username: "test500", password: "password555"}}
      expect(response).to render_template(:new)
    end

    it "validates presence of user" do
      #user[username],user{password}
      post :create, params: {user:{username: "test20", password: "password555"}}
      expect(response).to render_template(user_url(User.last))
    end



    it "validates length of password" do
      #user[username],user{password}
      post :create, params: {user:{username: "test25", password: "passw"}}
      expect(response).to render_template(:new)
    end
  end
end
