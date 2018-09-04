describe 'users/new.html.haml' do
  it 'has new_user form' do
    user = double("User")
    assign(:user, user)
    render
    expect(rendered).to have_selector('form#new_user')
  end

  it 'has user_email field' do
    expect(rendered).to have_selector('#email')
  end

  it 'has user_password field' do
    expect(rendered).to have_selector('#user_password')
  end

  it 'has register button' do
    expect(rendered).to have_selector('Sign up')
  end
end
