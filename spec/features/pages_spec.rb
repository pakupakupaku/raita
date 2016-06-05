require 'rails_helper'

RSpec.describe 'Page spec', type: :feature do
  let(:current_user) { create :user }
  before do
    login_as current_user
  end

  specify 'User creates and sees a new page' do
    visit "/"
    expect(page).to_not have_link('タイトル')

    click_on 'New Page'

    fill_in 'Title', with: 'タイトル'
    fill_in 'Body', with: '本文'
    click_on 'Create'

    expect(page).to have_css('.title', text: 'タイトル')
    expect(page).to have_css('.body', text: '本文')

    visit "/"
    expect(page).to have_link('タイトル')
  end
end
