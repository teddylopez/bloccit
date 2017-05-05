require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(3) }
  it { is_expected.to allow_value("user@bloccit.com").for(:email) }

  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
    end
  end

  describe "invalid user" do
    let(:user_with_invalid_name) { User.new(name: "", email: "user@bloccit.com") }
    let(:user_with_invalid_email) { User.new(name: "Bloccit User", email: "") }

    it "should be an invalid user due to blank name" do
      expect(user_with_invalid_name).to_not be_valid
    end

    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end

    it "should format the user's name" do
      user.name = "bloc user"
      user.save
      expect(user.name).to eq "Bloc User"
    end
  end

  describe "POST create" do
     it "returns an http redirect" do
       post :create, user: new_user_attributes
       expect(response).to have_http_status(:redirect)
     end

     it "creates a new user" do
      expect{
        post :create, user: new_user_attributes
      }.to change(User, :count).by(1)
    end

    it "sets user name properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).name).to eq new_user_attributes[:name]
    end

    it "sets user email properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).email).to eq new_user_attributes[:email]
    end

    it "sets user password properly" do
       post :create, user: new_user_attributes
       expect(assigns(:user).password).to eq new_user_attributes[:password]
    end

    it "sets user password_confirmation properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation]
    end
  end

end
