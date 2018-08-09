feature 'Registration' do
  scenario 'Visitor registers successfully via register form' do
    visit register_path
    within '#new_user' do
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password', with: '12345678'
      click_button('Sign Up')
    end
    expect(page).to have_content 'Home'
    expect(page).to have_content 'Shop'
    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Sign up'
    expect(page).not_to have_content 'Sign out'
    expect(page).to have_content 'Have an Account? Log in'
  end
end