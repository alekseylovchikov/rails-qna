require 'rails_helper'

feature 'Create question', %q{
  In order to get answer from community
  As an authenticated user
  I want to be able to ask questions
} do

  Given(:user) { create(:user) }

  scenario 'Authenticated user create question' do
    sign_in(user)

    visit questions_path
    click_on 'Ask question'
    fill_in 'Title', with: 'Test question'
    fill_in 'Body', with: 'Some text'
    click_on 'Create'

    #save_and_open_page
    #expect(page).to have_content 'Your question successfully created.'
  end

  scenario 'Non-authenticated user create question' do
    visit questions_path
    click_on 'Ask question'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end