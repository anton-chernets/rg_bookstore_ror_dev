Bookstore for RubyGarage

My process deploy:

Installing Homebrew
````
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
````
Installing Ruby
````
brew install rbenv ruby-build

# Add rbenv to bash so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile

# Install Ruby
rbenv install 2.5.1
rbenv global 2.5.1
ruby -v
````
Configuring Git
````
git config --global color.ui true
git config --global user.name "anton-chernets"
git config --global user.email "anton.fullstack@gmail.com"
ssh-keygen -t rsa -C "anton.fullstack@gmail.com"
````
into https://github.com/settings/keys enter key
````
cat ~/.ssh/id_rsa.pub
ssh -T git@github.com
````

Installing Rails

````
gem install rails -v 5.2.0
rbenv rehash
rails -v
````

Setting Up A Database: 
By default the postgresql user is your current OS X username with no password. For example, my OS X user is named ninja so I can login to postgresql with that username.

````
brew install postgresql
brew services start postgresql
````

Final Steps
````
rails new bookstore
rails new bookstore -d postgresql
cd bookstore
rake db:create
rails server
````

You can now visit http://localhost:3000 to view your new website!

For BDD

Add Gemfile

````
group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'faker'
end
````

````
$ bundle install
````

Init RSpec

````
$ rails g rspec:install
````

Add config/application.rb
````
config.generators do |g|
  g.test_framework :rspec
end
````

Add spec/spec_helper.rb
````
RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
````

Add spec/features/features_spec_helper.rb
````
require 'spec_helper'
require 'capybara/rspec'
````

Add specs/features/registration_spec.rb
````
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
````

Запускаем тест и он падает - не нашел маршрут
````
$ rspec spec/features/registration_spec.rb
````

Device

````
gem 'devise'
````

````
$ bundle
$ rails generate devise:install
$ rails generate devise User
$ rake db:migrate
$ rails generate devise:views
$ bundle install
````
стандартные пути
work vs http://localhost:3000/users/sign_up
work vs http://localhost:3000/users/sign_in

делаю дальше по слайдам  BDD только вьюхи haml
``````
$ gem "haml-rails"
$ rails generate haml:application_layout convert
$ rake haml:erb2haml
``````

Add /app/helpers/application_helper.rb
``````
module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end

``````

тест вьюхи не проходит
``````
$ rspec spec/views/users/new_spec.rb
``````

``````
$ rspec spec/models/user_spec.rb
``````
Вкинул в /device шаблоны с layout

поменял главную страницу на home/index

все миграции
``````
$ bin/rails generate migration create_categories
$ rake db:migrate
``````

авторизация
``````
gem 'cancancan'
$bundle install
$bundle update
``````

создал модели models

``````
gem 'aasm'
$bundle install
$bundle update
``````
создал сервисы

``````
gem 'carrierwave'
$bundle install
$bundle update
``````
создал загрузчики

``````
rake db:migrate:status
bin/rails db:rollback STEP=16
``````

``````
DELETE FROM public.schema_migrations
	WHERE version = '20180904085442';
``````
``````
bin/rails db:rollback STEP=7
``````
``````
DELETE FROM public.schema_migrations
	WHERE version = '20180904075207';
DELETE FROM public.schema_migrations
	WHERE version = '20180904075022';
``````
``````
bin/rails db:rollback STEP=3
``````
удалил index из миграции страны
``````
bin/rails db:rollback STEP=1
``````
``````
$ rake db:migrate
``````

закоментил строки авторизации сойсетей чтоб работала страница регистр
``````
-#- if devise_mapping.omniauthable?
-#  - resource_class.omniauth_providers.each do |provider|
-#    = link_to "Sign in with #{OmniAuth::Utils.camelize(provider)}", omniauth_authorize_path(resource_name, provider)
-#    %br/
``````

!logout

Info
Some core gems usage:

* RSpec
* Devise
* haml-rails
* CanCanCan
* CarrierWave
* AASM