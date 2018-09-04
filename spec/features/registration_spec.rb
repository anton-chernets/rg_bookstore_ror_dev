# feature 'Registration' do
#   scenario 'Visitor registers successfully via register form' do
#     visit register_path
#     within '#new_user' do
#       fill_in 'Email', with: Faker::Internet.email
#       fill_in 'Password', with: '12345678'
#       click_button('Sign up')
#     end
#     expect(page).not_to have_content 'Sign up'
#     expect(page).to have_content 'Sign out'
#     expect(page).to have_content 'You registered'
#   end
# end

feature 'Registration' do
  scenario 'Visitor registers successfully via register form' do
    visit register_path
      # expect(page).to have_content 'Home'
      # expect(page).to have_content 'Shop'
      # expect(page).to have_content 'Log in'
      # expect(page).not_to have_content 'Sign out'
      # expect(page).to have_content 'Have an Account? Log in'
      fill_in 'First name', with: 'test'
      fill_in 'Last name', with: 'test'
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_button 'Sign up'
      expect(page).not_to have_content 'Sign up'
  end

#   scenario 'Visitor is unsuccessfully registered through the registration form' do
#     visit new_user_registration_path
#       # expect(page).to have_content 'Home'
#       # expect(page).to have_content 'Shop'
#       # expect(page).to have_content 'Log in'
#       # expect(page).not_to have_content 'Sign out'
#       # expect(page).to have_content 'Have an Account? Log in'
#       fill_in 'Email', with: Faker::Internet.email
#       fill_in 'Password', with: '12345678'
#       fill_in 'Password confirmation', with: '12345678'
#       click_button 'Sign up'
#       expect(page).to have_content 'Sign up'
#   end
end