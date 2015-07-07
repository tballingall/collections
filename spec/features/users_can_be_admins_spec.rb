require 'feature_helper'

RSpec.feature 'Admin Accounts' do
  context 'given I am an authenticated admin' do
    let!(:user) { create_current_user}
    context 'and there are other users' do
      let(:other_user) { create(:user) }

      scenario 'I can edit their information' do
        visit edit_user_path(other_user)
        click_link('Edit')
        save_and_open_page
        fill_in 'Name', with: 'another name'
        click_button('Submit')
        expect(page).to have_content('Successfully Updated')
      end
    end
# Admin users will be flagged as such on their user profile page
  end
end
