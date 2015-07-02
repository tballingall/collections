require 'feature_helper'

RSpec.feature 'Edit User' do
  context 'I am a member I am logged in' do
    let(:member) { create(:user) }

    context 'I can edit my own information' do
      scenario 'should be able to edit my info using appropriate data' do
        log_in(member)
        visit edit_user_path(member)
        fill_in 'user_name', with: 'another name'
        click_button('Submit')
        expect(page).to have_content('Successfully Updated')
      end
    end

    context 'I try to edit information that is not mine' do
      let(:other_user) { create(:user) }

      scenario "I can't edit and should be forwarded to homepage with error" do
        log_in(member)
        visit edit_user_path(other_user)
        expect(page).to have_content('Log out')
      end
    end
  end

  context 'I am not logged in' do
    let(:user) { create(:user) }

    scenario 'should be able to view profiles' do
      visit user_path(user)
      save_and_open_page
      expect(page).to have_content('User Name')
    end
    scenario 'should not be able to edit profiles' do
      visit edit_user_path(user)
      expect(page).to have_content('Login')
    end
  end
end
