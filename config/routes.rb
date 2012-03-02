FormBuilder::Application.routes.draw do
  resources :templates do
    member do
      get :print
    end

    resources :pages, :only => [:update] do
      member do
        get :design
        post :design
      end
    end
  end

  root :to => 'templates#index'
end
