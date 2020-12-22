Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'input#index'
  get 'output' => 'output#output'
  get 'results' => 'output#results'

end
