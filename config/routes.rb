ActionController::Routing::Routes.draw do |map|
  map.resources :tarifarios

  map.resources :hoteis_pousadas
  map.resources :imovel_locacoes
  map.resources :restaurantes
  map.resources :bares_e_boates
  map.resources :clientes
  map.resources :estabelecimentos
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.admin 'admin', :controller => 'admin/dashboard', :action => 'index'
  map.root  :controller => 'dashboard', :action => 'index'
  map.resources :user_sessions
  map.resources :users

  map.namespace :admin do |admin|
    admin.resources :dashboard
    admin.resources :users
    admin.resources :clientes
    admin.resources :tarifarios
    admin.resources :hoteis_pousadas
    admin.resources :imovel_locacoes
    admin.resources :restaurantes
    admin.resources :bares_e_boates
    admin.resources :fotos
    admin.resources :estabelecimentos, :has_many => [:imovel_locacoes,:bares_e_boates,:restaurantes,:hoteis_pousadas,:tarifarios,:fotos]
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

