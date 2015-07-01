require 'feature_helper'

RSpec.feature 'Managing Images' do
  context 'given I am authenticated' do
    let! (:user) { create_current_user }
    let(:picture_name) { 'Octokitty' }
    context 'and I have an album' do
      let(:album) { create(:album, user: user) }

      scenario 'I can add an image to the album' do
        visit album_path(album)
        fill_in 'picture_name', with: picture_name
        fill_in 'picture_color', with: 'So Many'
        fill_in 'picture_description', with: 'Abomination'
        select 2013, from: 'picture_year'
        page.attach_file('picture_image', './spec/support/upload/octo.jpg')
        click_button('Submit')
        expect(page).to have_content('Success')
        expect(page).to have_content picture_name
        expect(page.html).to match(/octo.jpg/)
      end


    scenario 'I can see errors with incorrect information' do
      visit new_album_image_path(album) do
        page.attach_file('picture_image', './spec/support/upload/octo.jpg')
        fill_in 'picture_name', with: picture_name
        fill_in 'picture_color', with: ''
        fill_in 'picture_description', with: 'Abomination'
        select 2013, from: 'picture_year'
        click_button('Submit')
        expect(page).to have_content('Error')
    end
  end

    context 'given another users album' do
      let!(:album) { create(:album) }

      scenario 'I cannot add images' do
        visit album_path(album)
        expect(page).to_not have_link('Add Picture')
        visit edit_album_path(album)
        expect(page).to have_content('current_user.name')
      end

    context 'given an image' do
      let(:picture) { create(:picture, album: album) }

      scenario 'I can not set an image primary' do
        visit album_path(album)
        expect(page).to_not have_link('Make Primary')
      end
    end


    context 'given that I have added an image to my album' do
      let!(:picture) { create(:picture, album: album) }
        let(:new_file) { './spec/support/upload/octo.jpg' }
        let(:new_image) { "//img[contains(@src, \"octo.jpg\")]" }
        let(:original_image) do
          "//img[contains(@src, \"#{picture.image_name}\")]"
        end

        scenario 'The image will be labeled primary' do
          visit user_path(user)
          expect(page).to have_xpath original_image
        end

        scenario 'I can make another image primary' do
          visit user_path(user)
          expect(page).to have_xpath original_image
          expect(page).to_not have_link('Make Primary')
          visit new_album_image_path(album) do
            page.attach_file('picture_image', './spec/support/upload/octo.jpg')
            fill_in 'picture_name', with: picture_name
            fill_in 'picture_color', with: 'ROYGBV'
            fill_in 'picture_description', with: 'Abomination'
            select 2013, from: 'picture_year'
          end
          click_link('Submit')
          expect(page).to have_content('Success')
          expect(page).to have_xpath original_image
          expect(page).to have_xpath new_image
          within("##{dom_id(Image.last)}") do
            click_link('Make Primary')
          end
          visit user_path(user)
          expect(page).to have_content('Success')
          expect(page).to have_xpath new_image
          end
        end
      end
    end
  end
end
