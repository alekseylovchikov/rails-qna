require 'rails_helper'

feature 'User sign in', %q{
  In order to be able to ask question
  As an user
  I want to be able to sign in
} do
  scenario 'Registered user try sign in' do
    User.create!(email: 'user@gmail.ru', password: '123456789')

    visit new_user_session_path
    fill_in 'Email', with: 'user@gmail.ru'
    fill_in 'Password', with: '123456789'
    # save_and_open_page
    click_on 'Log in'

    expect(page).to have_content 'Signed in successfully.'
    expect(current_path).to eq(root_path)
  end

  scenario 'Non-registered user try sign in' do
    visit new_user_session_path
    fill_in 'Email', with: 'wrong@gmail.ru'
    fill_in 'Password', with: '987654321'
    click_on 'Log in'

    # save_and_open_page
    expect(page).to have_content 'Invalid Email or password.'
    expect(current_path).to eq(new_user_session_path)
  end
end