Spree::Core::Engine.add_routes do
  resources :contacts, controller: 'contact_us/contacts', only: %i[new create]
  get 'contact-us' => 'contact_us/contacts#new', as: :contact_us
  post 'contact-us' => 'contact_us/contacts#create'

  namespace :api, defaults: { format: 'json' } do
    namespace :v2 do
  	  namespace :storefront do
  	  	post 'contact_us' => 'contacts#create'
  	  end
  	end
  end	
end
