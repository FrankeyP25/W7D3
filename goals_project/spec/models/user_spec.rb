require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    User.create!(username: "test12", password: "password888")
  end

  describe "encryption test" do
    it "utilize bcrypt to encrypt the password" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: "test13", password: "passcode111")
    end

    it "does npot save unencrypted password to db" do
      User.create!(username: "test13", password: "passcode111")
      user = User.find_by(username: "test13")
      expect(user.password).not_to be("passcode111")
    end
  end
  it {should validate_presence_of(:username)}
  #it {should validate_presence_of(:password)}
  it {should validate_uniqueness_of(:username)}
end
