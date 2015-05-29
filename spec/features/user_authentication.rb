require 'feature_helper'

RSpec.feature 'Authentication' do
  let(:password) { 'super secure password' }
  let(:user) do
    create(:user, password: password, password_confirmation: password)
  end

  context 'I exist' do
    let(:email) { user.email }

    context 'with correct email and password' do
      scenario 'allows me to log in' do
        visit root_url
        expect(page).to have_link('Login')
        expect(page).to_not have_link('Logout')
        click_link('Login')
        expect(page).to have_content('Email')
        fill_in 'Email', with: email
        fill_in 'Password', with: password
        click_button('Log in')
        expect(page).to have_link('Logout')
        expect(page).to_not have_link('Login')
        expect(page).to_not have_link('Sign up')
      end
    end

    context 'with incorrect credentials' do
      let(:email) { 'not an email' }

      scenario 'does not allow me to log in' do
        visit root_url
        expect(page).to have_link('Login')
        expect(page).to_not have_link('Logout')
        click_link('Login')
        expect(page).to have_content('Email')
        fill_in 'Email', with: 'wrong email'
        fill_in 'Password', with: 'not the password'
        click_button('Log in')
        expect(page).to have_content('Invalid')
        expect(page).to have_button('Log in')
        expect(page).to have_link('Sign up now!')
      end
    end

    context 'and I am logged in' do
      background { create(:user) }

      scenario 'allows me to log out' do
        visit @user
        click_link('Logout')
        expect(page).to have_content('Logged out!')
      end
    end
  end
end
