describe 'users/new.html.haml' do
  it 'has new_user form' do
    user = double("User")
    assign(:user, user)
    render
    expect(rendered).to have_selector('form#new_user')
  end
end