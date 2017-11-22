Rails.application.routes.draw do

  # 资源路由的扩展路由之集合路由collection
  resources :posts do
    # 单独配置集合路由
    # get 'recent', :on => :collection

    # 配置多条集合路由
    collection do
      get 'recent'
    end

    # 成员路由member
    member do
      get 'recent'
    end

  end

  # 用except排除默认的show方法
  # resources :posts, :except => :show

  # 自定义一般路由：请求方式 '路由地址', 处理方法
  get 'posts/:id', :to => 'posts#show'

  # 自定义命名路由：
  post 'posts/:id', :to => 'posts#show', :as => 'show_post'

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
