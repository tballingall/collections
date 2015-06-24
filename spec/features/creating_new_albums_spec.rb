require 'feature_helper'

RSpec.feature 'An authenticated user can add a new image collection to their account' do
  let(:member) { create (:user) }
  let(:album_name) { 'That One Time' }

  context 'I am a logged in member' do
    scenario 'A link to this image collection will appear on my profile page' do
      visit user_path(member)
      expect(page).to have_link('Your Albums')
      click_link('Your Albums')
     end
  end
end

# I can edit information for my image collection
# I can not edit information for the image collection for others