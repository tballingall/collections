require 'feature_helper'

RSpec.feature 'Credentialing' do
  scenario 'it runs' do
    expect(true).to eq true
    create_current_user
  end
end
