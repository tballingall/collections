require 'feature_helper'

RSpec.feature 'Managing Images' do
  context 'As a user with admin rights' do
    let!(:admin) { create_current_admin }
    let!(:user) { create_current_user }

    scenario 'I can access an index of all images' do
      visit user_path(admin)
      click_link 'Admin Review'
      save_and_open_page
      expect(page).to have_content(image.alt_text)
    end
  end
end
