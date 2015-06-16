require 'feature_helper'

RSpec.feature 'User create' do
  let(:name) { 'thisguy' }
  let(:email) { 'not@thatguy.com' }
  let(:password) { 'words' }
  let(:password_confirmation) { 'words' }

  context 'As an uncredentialed user' do
    context 'with acceptable information' do
      scenario 'I can register for a new account' do
        visit new_user_path
        expect(page).to have_content('Name')
        fill_in 'user_name', with: name
        fill_in 'user_email', with: email
        fill_in 'user_password', with: password
        fill_in 'user_password_confirmation', with: password_confirmation
        click_button 'Choose file' attach_file "UserPic",
         '~/Mac_U/images/download.jpg'
        click_button 'Submit'
        expect(page).to have_content('Signed Up')
      end
    end

  context 'I am a member I am logged in' do
    let(:member) { create(:user) }

    context 'I can edit my own picture' do
      scenario 'should be able to edit my picture using appropriate data' do
        log_in(member)
        visit edit_user_path(member)
        click_button 'Choose file' attach_file "UserPic",
         '~/Mac_U/images/download.jpg'
         click_button 'Submit'
        expect(page).to have_content('Success')
      end
    end