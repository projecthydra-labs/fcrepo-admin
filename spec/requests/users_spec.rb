require 'spec_helper'

describe "Users" do

  before do
    @email = 'user@example.com'
    @password = '12345678'
    @user = User.create(:email => @email, :password => @password)
  end

  after do
    @user.delete
  end

  it "should be able to login" do
    visit new_user_session_path
    fill_in "Email", :with => @email
    fill_in "Password", :with => @password
    click_button "Sign in"
    page.should have_content "Signed in successfully"
    page.should have_link("Sign out", :href => destroy_user_session_path)
  end

  it "should be able to logout" do
    visit new_user_session_path
    fill_in "Email", :with => @email
    fill_in "Password", :with => @password
    click_button "Sign in"
    click_link "Sign out"
    page.should have_content "Signed out"
    page.should have_link("Sign in", :href => new_user_session_path)
  end

end
