require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "profile page" do
  # Code to make a user variable
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1', text: 'Account') }
    it { should have_selector('title', text: full_title('Account')) }
  end

  describe "sign up page" do
    before { visit signup_path }

    it { should have_selector('h1', text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end

  describe "sign up" do
    before { visit signup_path }

    let(:submit) { "Sign Up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      
      describe "after submission" do
        before { click_button submit }
        
        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
        it { should have_selector('div.alert.alert-error', content: 'error') }
        it { should have_selector('li', text: "* Email can't be blank") }
        it { should have_selector('li', text: "* Email is invalid") }
        it { should have_selector('li', text: "* Password can't be blank") }
        it { should have_selector('li', text: "* Password is too short (minimum is 6 characters)") }
        it { should have_selector('li', text: "* Password confirmation can't be blank") }
        it { should_not have_selector('li', text: "* Password digest can't be blank") }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Password confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }
        
        it { should have_selector('title', text: 'Account') }
        it { should have_selector('div.alert.alert-success', text: 'Please check your email to complete your registration.')}
      end
    end
  end
end
