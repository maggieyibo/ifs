 require 'rails_helper'

RSpec.describe User, :type => :model do
	let(:user) {User.new(first_name: "Rocket", last_name: "Jones", email: "rocket@example.com", password: "password")}
  	
  it "responds to a first name" do
    expect(user).to respond_to(:first_name)
  end

  it "is invalid without a first name" do
  	user.first_name = nil
  	expect(user).to be_invalid
  end

  it "raises an error without a first name" do
  	user.first_name = nil
  	expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "responds to a last name" do
    expect(user).to respond_to(:last_name)
  end

  it "is invalid without a last name" do
  	user.last_name = nil
  	expect(user).to be_invalid
  end

  it "raises an error without a last name" do
  	user.last_name = nil
  	expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "responds to a email" do
    expect(user).to respond_to(:email)
  end

  it "is invalid without a email" do
  	user.email = nil
  	expect(user).to be_invalid
  end

  it "raises an error without a email" do
  	user.email = nil
  	expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "validates uniqueness of email" do
  	user2 = User.new(first_name: "John", last_name: "Smith", email: "rocket@example.com", password: "password")
  	expect(user.save!).to be true
  	expect(user2).to be_invalid
  end

  it "it doesn't respond to a password" do
  	user.save
  	userx = User.find_by(email: "rocket@example.com")
    expect(userx.password).not_to eq("password")
  end

  it "creates a password_digest" do
  	expect(user.password_digest).to be_a(String)
  end

end
