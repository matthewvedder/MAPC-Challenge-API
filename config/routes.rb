Rails.application.routes.draw do
  match '/users' => 'users#create', via: [ :post, :options ]
end
