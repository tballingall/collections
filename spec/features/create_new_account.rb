require 'feature_helper'

RSpec.feature 'Registering' do
  let(:name) { 'thisguy' }
  let(:email) { 'not@thatguy.com' }
  let(:password) { 'words' }
  let(:password_confirmation) { 'words' }

  context 'As an uncredentialed user' do
    context 'with acceptable information' do
      scenario 'I can register for a new account' do
        visit '/users/new'
        #click_link 'Sign up'
        expect(page).to have_content 'Name' do
          fill_in 'user_name', with: name
          fill_in 'user_email', with: email
          fill_in 'user_password', with: password
          fill_in 'user_password_confirmation', with: password_confirmation
        end
        click_button 'Sign Up'
        expect(page).to have_content 'Signed Up'
      end
    end
        context 'with unacceptable information' do
          let(:name) { nil }

          scenario 'I can see errors' do
            visit '/users/new'
           expect(page).to have_content 'Sign Up'
            fill_in 'user_name', with: name
            fill_in 'user_email', with: email
            fill_in 'user_password', with: password
            fill_in 'user_password_confirmation', with: password_confirmation
          click_button 'Sign Up'
          expect(page).to have_content 'Failed due to'
        end
      end
    end
end
