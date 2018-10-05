module Shopping
  class Engine < ::Rails::Engine
    isolate_namespace Shopping

    config.generators do |g|
      g.test_framework :rspec
      # g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    initializer 'shopping' do
      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.include Shopping::ModelMethods
      end

      ActiveSupport.on_load :action_controller do
        ActionController::Base.include Shopping::ControllerMethods
        ActionController::Base.helper Shopping::ApplicationHelper
      end
    end
  end
end
