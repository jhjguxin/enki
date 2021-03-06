Enki::Application.routes.draw do
  scope "(:locale)", :locale => /en|zh-CN/ do
    devise_for :users

    get "/search" => "search#index", :as => :search

    namespace 'admin' do
      #resource :session
      resources :posts, :pages do
        post 'preview', :on => :collection
      end
      resources :comments
      resources :undo_items do
        post 'undo', :on => :member
      end
      root :to => 'dashboard#show'
    end

    resources :archives, :only => [:index]
    resources :pages, :only => [:show]

    constraints :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ do
      get ':year/:month/:day/:slug/comments'  => 'comments#index'
      post ':year/:month/:day/:slug/comments' => 'comments#create'
      get ':year/:month/:day/:slug/comments/new' => 'comments#new'
      get ':year/:month/:day/:slug' => 'posts#show'
    end

    scope :to => 'posts#index' do
      get 'posts.:format', :as => :formatted_posts
      get '(:tag)', :as => :posts
    end

    root :to => 'posts#index'
  end
  get '/:locale' => 'posts#index'
  # config/routes.rb
  #scope "/:locale" do
    #resources :books
  #end
end
