require 'spec_helper'

describe "ProfileView", type: :feature do
  describe "profile page" do

    before(:all) do
      @user = User.create(full_name: Faker::Name.name,
        username: Faker::Internet.user_name,
        email: Faker::Internet.email,
        password: "password"
      )

    end

    it "it doesn't render the bio form on a users page" do

      visit "/users/#{@user.id}"

      save_and_open_page

      expect(page).not_to have_button('Submit')

    end

    it "it doesn't render the Tweet form on a users page" do

      visit "/users/#{@user.id}"

      save_and_open_page

      expect(page).not_to have_button('Tweet it!')
    end

      it "it doesn't render the update bio button on a users page" do

      visit "/users/#{@user.id}"

      save_and_open_page

      expect(page).not_to have_button('Update')
    end

    after(:all) do
      User.destroy_all
    end

  end
end


